import cv2
from IPython import display
import PIL

def cv2_imshow(img) -> None:
    img = img.clip(0, 255).astype('uint8')
    # cv2 stores colors as BGR; convert to RGB
    if img.ndim == 3:
        if img.shape[2] == 4:
            img = cv2.cvtColor(img, cv2.COLOR_BGRA2RGBA)
        else:
            img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    display.display(PIL.Image.fromarray(img))

def getCamera(width:int, height:int, framerate:int):
    cam = cv2.VideoCapture(f"nvcamerasrc ! video/x-raw(memory:NVMM), width=(int){width}, height=(int){height}, format=(string)I420, framerate=(fraction){framerate}/1 ! nvvidconv flip-method=0 ! video/x-raw, format=(string)BGRx ! videoconvert ! video/x-raw, format=(string)BGR ! appsink")
    return cam

__all__ = ["cv2_imshow", "getCamera"]