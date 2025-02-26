import pandas as pd
import joblib
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor

df = pd.read_csv("dataset.csv")

# Extract features & target
X = df.drop(columns=["Combinational_Depth"])
y = df["Combinational_Depth"]

# Train-Test Split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train Random Forest Model
model = RandomForestRegressor(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Save the model
joblib.dump(model, "depth_prediction_model.pkl")

print("✅ Model trained & saved successfully!")
