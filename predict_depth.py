import joblib
import pandas as pd
import sys
from ext import extract_rtl_features

model = joblib.load("depth_prediction_model.pkl")

# Function to predict combinational depth for a given signal
def predict_combinational_depth(rtl_file, signal):
    rtl_features = extract_rtl_features(rtl_file) 

    X_rtl = pd.DataFrame([rtl_features])
    predicted_depth = model.predict(X_rtl)[0]
    return predicted_depth

if __name__ == "__main__":
    rtl_file = input("Enter RTL file path: ")
    signal = input("Enter signal name for depth prediction: ")

    predicted_depth = predict_combinational_depth(rtl_file, signal)
    print(f"🔮 Predicted Combinational Depth for '{signal}': {int(predicted_depth)}")
