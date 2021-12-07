import sys
import numpy as np
import cv2
import matplotlib.pyplot as plt
from PIL import Image

def bin_detection(im):
    """
    im - RGB image numpy array
    """
    # define the lower and upper boundaries of the green ball in the HSV color space
    lower_boundary = (36, 0, 0)
    upper_boundary = (70, 255,255)

    # blur image
    blurred_im = cv2.GaussianBlur(im, (11, 11), 0)
    hsv_im = cv2.cvtColor(blurred_im, cv2.COLOR_RGB2HSV)

    # construct a mask for the green ball
    mask = cv2.inRange(hsv_im, lower_boundary, upper_boundary)
    # remove artifacts
    mask = cv2.erode(mask, None, iterations=2)
    # restore cluster mass after erosion
    mask = cv2.dilate(mask, None, iterations=2)

    contours = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)[0]
    pixel = None
    if len(contours) > 0:
        # find the largest contour in the mask
        max_contour = max(contours, key=cv2.contourArea)
        right_edge, left_edge = np.max(max_contour[:,0]), np.min(max_contour[:,1])
        center_x = (right_edge + left_edge) / 2
        pxl = point_below(max_contour, center_x)

    return pixel

def point_below(contour, x_coord):
    """
    Compute point along bottom edge of contour at x_coord
    """
    candidates = []
    for pt in contour:
        if abs(pt[0] - x_coord) <= 1:
            candidates.append(pt)
    candidates = np.array(candidates)
    # candidates = np.where(contour, np.abs(contour[:, 0] - x_coord) <= 1)
    return candidates[np.argmin(candidates[:, 1])]


def bin_pose_estimation(pixel, camera_pose, camera_rotation, intrinsic_matrix, floor_height=0, shift_to_center=0.2):
    """
    pixel - (x,y) in pxls of pxl below center of mass on the edge of bin/ground
    camera_pose - (x,y,z) in meters of camera position
    camera_rotation - 3x3 matrix that rotates from camera reference frame to robot base reference frame (z is up)
    intrinsic_matrix - 3x2 matrix that maps pixel coordinates to homogenous coordinates in meters
    floor_height - z coordinate of floor plane in robot base reference frame
    shift_to_center - distance from edge of bin to center of bin

    Returns estimated bin pose in robot reference frame
    """
    homogenous_coords = intrinsic_matrix @ pixel
    ray = camera_rotation @ homogenous_coords

    ray_dist = (floor_height - camera_pose.z) / ray.z
    bin_pose = camera_pose + ray * ray_dist
    xy_ray = np.array([ray[0], ray[1], 0])
    xy_ray = xy_ray/np.linalg.norm(xy_ray)

    bin_center_pose = bin_pose + shift_to_center * xy_ray
    return bin_center_pose

def bin_cartesian_to_polar(pose, reference):
    """
    pose - (x,y,z) of bin in robot reference frame
    reference - (x,y,z) of elbow in robot reference frame

    Returns angle and distance from elbow to bin (only considering the xy plane)
    """
    xy_vec = (pose - reference)[:2]
    angle = np.atan2(xy_vec[1], xy_vec[0])
    distance = np.linalg.norm(xy_vec)
    return angle, distance

