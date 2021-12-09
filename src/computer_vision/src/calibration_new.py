import numpy as np
import cv2

CHECKERBOARD = (7,9)


# stop the iteration when specified
# accuracy, epsilon, is reached or
# specified number of iterations are completed.
criteria = (cv2.TERM_CRITERIA_EPS +
            cv2.TERM_CRITERIA_MAX_ITER, 30, 0.001)


# Vector for 3D points
obj_points = []

# Vector for 2D points
img_points = []


#  3D points real world coordinates
objectp3d = np.zeros((1, CHECKERBOARD[0]
                      * CHECKERBOARD[1],
                      3), np.float32)
objectp3d[0, :, :2] = np.mgrid[0:CHECKERBOARD[0],
                               0:CHECKERBOARD[1]].T.reshape(-1, 2)

 
filename = "cc.png"
image = cv2.imread(filename)
grayColor = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# Find the chess board corners
# If desired number of corners are
# found in the image then ret = true
ret, corners = cv2.findChessboardCorners(
                grayColor, CHECKERBOARD,
                cv2.CALIB_CB_ADAPTIVE_THRESH
                + cv2.CALIB_CB_FAST_CHECK +
                cv2.CALIB_CB_NORMALIZE_IMAGE)

# If desired number of corners can be detected then,
# refine the pixel coordinates and display
# them on the images of checker board
if ret == True:
    obj_points.append(objectp3d)

    # Refining pixel coordinates
    # for given 2d points.
    corners2 = cv2.cornerSubPix(
        grayColor, corners, (11, 11), (-1, -1), criteria)

    img_points.append(corners2)

    # Draw and display the corners
    image = cv2.drawChessboardCorners(image,
                                        CHECKERBOARD,
                                        corners2, ret)
else:
    print("Failed")

cv2.imshow('img', image)
cv2.waitKey(0)

cv2.destroyAllWindows()

ret, matrix, distortion, r_vecs, t_vecs = cv2.calibrateCamera(
    obj_points, img_points, grayColor.shape[::-1], None, None)

Lcam = matrix.dot(np.hstack((cv2.Rodrigues(r_vecs[0])[0],t_vecs[0])))

np.savez("intrinsics",
    matrix=matrix, distortion=distortion,
    r_vecs=r_vecs, t_vecs=t_vecs, Lcam=Lcam,
    obj_points=obj_points, img_points=img_points)

# 7.4 in x 9.7 in
# 8 x 11 squares

