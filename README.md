#RTL-Based Combinational Depth Prediction using Machine Learning
Problem Statement
Predicting the combinational depth of a digital circuit typically requires synthesis and timing analysis, which are computationally expensive. This project aims to estimate combinational depth directly from RTL code using a machine learning model trained on extracted RTL features.

Overview
The project extracts key structural and logical features from Verilog files and uses them to train an ML model to predict combinational depth. The approach eliminates the need for full synthesis, making depth estimation faster and more efficient.

Methodology to Solve
Feature Extraction: Analyze RTL files to count logic gates, flip-flops, input/output ports, assignments, and always blocks.
Dataset Creation: Generate a dataset by extracting features from multiple RTL designs and associating them with known combinational depths.
Model Training: Train a Random Forest Regressor using extracted RTL features.
Prediction: Use the trained model to estimate combinational depth for new RTL designs.
Error Analysis: Compare predicted depths with actual values to assess model performance.
Approach
Extract Features:

Parse RTL files and count logical elements (AND, OR, XOR, NAND, NOR, etc.).
Identify structural components such as always blocks, flip-flops, and assignments.
Store extracted features in a structured dataset.
Train Machine Learning Model:

Use a Random Forest Regressor to learn patterns between extracted features and combinational depth.
Perform train-test split and evaluate performance.
Prediction Process:

Extract features from new RTL files.
Feed extracted features into the trained model for depth estimation.
Error Analysis:

Compute absolute error between predicted and actual depths.
Identify worst-case predictions to refine the model.
Error Analysis
The error analysis step compares predicted and actual combinational depths using absolute error calculations. The worst predictions are identified to improve the model further. The error_analysis.py script evaluates the model's accuracy and generates an error_analysis_report.csv for further analysis.

ML Trained Model for Prediction
The trained model (depth_prediction_model.pkl) is used to predict combinational depth based on extracted RTL features. The predict_depth.py script loads this model, processes new RTL files, and outputs the estimated combinational depth.
