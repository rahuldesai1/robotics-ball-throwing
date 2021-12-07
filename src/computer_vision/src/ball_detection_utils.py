import sys
import numpy as np
import cv2
import matplotlib.pyplot as plt
from PIL import Image

def ball_detection(im):
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
    center = None
    radius = None
    if len(contours) > 0:
        # find the largest contour in the mask
        max_contour = max(contours, key=cv2.contourArea)
        # compute the minimum enclosing circle
        ((x, y), radius) = cv2.minEnclosingCircle(max_contour)

        # draw circle onto image
        im = cv2.circle(im, (int(x), int(y)), int(radius), (0, 255, 255), 1)
        plt.imshow(im)
        plt.show()
        center = (x, y)

    return center, radius

def ball_pose_estimation(position):
    """
    position - (x, y) coordinates of the center of the ball in the image
    """
    # image size is 400 x 252
    base_xy_position = [0.695, 0.330, -0.010]
    x_ppx_scale = 0.0002885791070673891 # per pixel shift from the base position
    y_ppx_scale = -0.0017542260504471894
    estimated_ball_position = np.copy(base_xy_position)
    # center of image at (176, 200)
    estimated_ball_position[0] += x_ppx_scale * (176 - position[1])
    estimated_ball_position[1] += y_ppx_scale * (200 - position[0])
    return estimated_ball_position

def read_image(filepath):
    im = Image.open(filepath)
    return im

if __name__ == "__main__":
    arg = sys.argv[1]
    if arg == 'detection':
        img = np.asarray(read_image('balls/pose1.png')).astype(np.uint8)
        # plt.imshow(img)
        # plt.show()
        center, rad = ball_detection(img)
        print("Pose 1 Center: ", center)
        img = np.asarray(read_image('balls/pose2.png')).astype(np.uint8)
        # plt.imshow(img)
        # plt.show()
        center, rad = ball_detection(img)
        print("Pose 2 Center: ", center)
        img = np.asarray(read_image('balls/pose3.png')).astype(np.uint8)
        # plt.imshow(img)
        # plt.show()
        center, rad = ball_detection(img)
        print("Pose 3 Center: ", center)
        img = np.asarray(read_image('balls/pose4.png')).astype(np.uint8)
        # plt.imshow(img)
        # plt.show()
        center, rad = ball_detection(img)
        print("Pose 4 Center: ", center)
    
    if arg == 'estimation':
        p1_center = (188.98760986328125, 121.0034408569336)
        p1_estimated = ball_pose_estimation(p1_center)
        print(p1_estimated)

    if arg == 'ratio_estimation':
        base = np.array([200, 176])
        p1_center = np.array([188.98760986328125, 121.0034408569336])
        p2_center = np.array([21.5, 150.0])
        p3_center = np.array([280.3421325683594, 179.91677856445312])
        p4_center = np.array([150.23248291015625, 224.9076385498047])

        base_act = np.array([0.695, 0.330])
        p1_act = np.array([0.696, 0.371])
        p2_act = np.array([0.683, 0.590])
        p3_act = np.array([0.609, 0.267])
        p4_act = np.array([0.568, 0.439])

        p1_px_shift = p1_center - base
        p1_shift = p1_act - base_act
        p1_ratio = p1_shift/np.flip(p1_px_shift)

        p2_px_shift = p2_center - base
        p2_shift = p2_act - base_act
        p2_ratio = p2_shift/np.flip(p2_px_shift)

        p3_px_shift = p3_center - base
        p3_shift = p3_act - base_act
        p3_ratio = p3_shift/np.flip(p2_px_shift)

        p4_px_shift = p4_center - base
        p4_shift = p4_act - base_act
        p4_ratio = p4_shift/np.flip(p4_px_shift)
        
        shifts = np.vstack((p1_ratio, p2_ratio))
        shifts = np.vstack((shifts, p3_ratio))
        shifts = np.vstack((shifts, p4_ratio))
        x_shift = np.average(shifts[:, 0])
        y_shift = np.average(shifts[:, 1])
        print("X ppx scale: ", x_shift)
        print("Y ppx scale: ", y_shift)