import pandas as pd
import joblib
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

# Load dataset
df = pd.read_csv("dataset1.csv")

# Ensure correct column names
print("📝 Available columns:", df.columns.tolist())

# Extract features & target
X = df.drop(columns=["Combinational_Depth"])
y_true = df["Combinational_Depth"]

# Load trained model
model = joblib.load("depth_prediction_model.pkl")

# Make predictions
y_pred = model.predict(X)

# Compute error metrics
mae = mean_absolute_error(y_true, y_pred)
mse = mean_squared_error(y_true, y_pred)
r2 = r2_score(y_true, y_pred)

print(f"\n Model Performance:")
print(f" Mean Absolute Error (MAE): {mae:.2f}")
print(f" Mean Squared Error (MSE): {mse:.2f}")
print(f" R² Score: {r2:.2f}")

# Add predictions and errors to the dataset
df["Predicted_Depth"] = y_pred
df["Absolute_Error"] = abs(df["Combinational_Depth"] - df["Predicted_Depth"])

# Check if 'RTL_File' exists
if "RTL_File" in df.columns:
    error_analysis = df.sort_values(by="Absolute_Error", ascending=False)
    print("\n🔍 Top 5 Worst Predictions:")
    print(error_analysis[["RTL_File", "Combinational_Depth", "Predicted_Depth", "Absolute_Error"]].head())
else:
    print("\n 'RTL_File' column missing! Showing error analysis without it.")
    error_analysis = df.sort_values(by="Absolute_Error", ascending=False)
    print(error_analysis[["Combinational_Depth", "Predicted_Depth", "Absolute_Error"]].head())

# Save analysis report
error_analysis.to_csv("error_analysis_report.csv", index=False)
print("\n📄 Error analysis saved to 'error_analysis_report.csv'")
