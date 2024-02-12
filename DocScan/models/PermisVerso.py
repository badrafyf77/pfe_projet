from datetime import datetime
from pyimagesearch import imutils
from pyimagesearch import transform
import cv2 
import re
from models.Contour import Contour
import pytesseract
pytesseract.pytesseract.tesseract_cmd = '.\\Scripts\\Tesseract-OCR\\tesseract.exe'
cnt = Contour()

class PermisVerso():
    def __init__(self,image_path):
        self.image_path=image_path
    def data(self):
            while True:
                RESCALED_HEIGHT = 500.0
                
                image=self.image_path
                assert(image is not None)
                
                ratio = image.shape[0] / RESCALED_HEIGHT
                orig = image.copy()
                rescaled_image = imutils.resize(image, height =int(RESCALED_HEIGHT))

                # get the contour of the document
                screenCnt = cnt.get_contour(rescaled_image)

        
                warped = transform.four_point_transform(orig, screenCnt * ratio)
                warped= cv2.resize(warped,(800,600))
                img=warped.copy()
                gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

                sharpen = cv2.GaussianBlur(img, (0,0), 3)
                sharpen = cv2.addWeighted(img, 1.5, sharpen, -0.5, 0)
        
                #Date de validite
                ddv_crp= img[380:420,70:250]

                ocr_text = pytesseract.image_to_string(ddv_crp)
                data=self.remove_non_alphanumeric(ocr_text)
                data_cin={"ddv":data}
                return data_cin
            
    def remove_non_alphanumeric(self,input_string):
        filtered_string = ''.join(char for char in input_string if char.isupper() or char.isdigit() or char in {' ', '.', '/','|'})
        date=self.extract_date_format(filtered_string)
        if date:
            return date
        return filtered_string
    def extract_date_format(self,input_string):
        date_match = re.search(r'\b(?:\D*)(\d{2}[./]\d{2}[./]\d{4})\b', input_string)
        
        if date_match:
            return date_match.group(1)
        else:
            return None