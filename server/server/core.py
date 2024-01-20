from keras.models import load_model
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from keras.preprocessing.image import img_to_array
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

    # Define your target size based on your model's input size
    target_size = (224, 224)

    # Prepare the image
    prepared_image = prepare_img(image, target_size)

    # Make predictions using your model
    predictions = model.predict(prepared_image)

    # You can customize this response based on your requirements
    response_data = {'predictions': predictions.tolist()}

    return Response(response_data, status=status.HTTP_200_OK)

