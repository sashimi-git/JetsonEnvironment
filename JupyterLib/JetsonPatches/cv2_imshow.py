from IPython import display
from PIL import Image
import cv2

def cv2_imshow(img) -> None:
    img = img.clip(0, 255).astype('uint8')
    # cv2 stores colors as BGR; convert to RGB
    if img.ndim == 3:
        if img.shape[2] == 4:
            img = cv2.cvtColor(img, cv2.COLOR_BGRA2RGBA)
        else:
            img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    display.display(Image.fromarray(img))