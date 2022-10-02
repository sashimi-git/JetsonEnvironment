import cv2

def getCamera(width:int, height:int, framerate:int):
    cam = cv2.VideoCapture(f"nvcamerasrc ! video/x-raw(memory:NVMM), width=(int){width}, height=(int){height}, format=(string)I420, framerate=(fraction){framerate}/1 ! nvvidconv flip-method=0 ! video/x-raw, format=(string)BGRx ! videoconvert ! video/x-raw, format=(string)BGR ! appsink")
    return cam