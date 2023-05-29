import os
import numpy as np
import cv2
import keras.models as models
from flask import Flask, request

app = Flask(__name__)

model = models.load_model('mymodel')

@app.route('/predict', methods=['POST'])
def predict_digit():
    # Read the image using OpenCV
    img = cv2.imdecode(np.fromstring(request.files['image'].read(), np.uint8), cv2.IMREAD_GRAYSCALE)
    img = cv2.resize(img, (28, 28)) # Resize - important!
    img = (img / 255) - 0.5  # Normalize image data
    img_tensor = np.expand_dims(img, axis=0)
    prediction = model.predict(img_tensor)
    predicted_digit = np.argmax(prediction[0])
    return str(predicted_digit)

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
