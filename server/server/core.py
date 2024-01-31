from keras.models import load_model
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from keras.preprocessing.image import img_to_array
from keras.preprocessing.image import save_img 
import tensorflow as tf 
import base64
import io
import numpy as np
from PIL import Image

# Load your Keras model
model = load_model("test.h5")

def prepare_img(image, target_size):
    if image.mode != 'RGB':
        image = image.convert('RGB')
    image = image.resize(target_size)
    image = img_to_array(image)
    image = (image - 127.5) / 127.5
    image = np.expand_dims(image, axis=0)
    return image

@api_view(['POST'])
def predict(request):
    json_data = request.data
    image_str = json_data.get('image', '')
    image_data = base64.b64decode(image_str)
    image = Image.open(io.BytesIO(image_data))
    target_size = (256, 256)

    prepared_image = prepare_img(image, target_size)

    predictions = model.predict(prepared_image)
    out = 'out.png'
    sav = './out/'
    output =  tf.reshape(predictions , [256 , 256 , 3])
    output = (output+1)/2
    save_img(sav+out,img_to_array(output))
    l1 =Image.open(sav+out)
    l1  = l1.resize((50,50))
    l1.save(sav+"path"+out) 
    with open(sav+"path"+out ,'rb') as ass :
        end = base64.b64encode(ass.read())
    
    response_data = {'predictions': str(predictions) }
    return response_data 

    return Response(response_data, status=status.HTTP_200_OK)

