# RTL-Based Combinational Depth Prediction using Machine Learning

## Problem Statement
Predicting the combinational depth of a digital circuit typically requires synthesis and timing analysis, which are computationally expensive. This project aims to estimate combinational depth directly from RTL code using a machine learning model trained on extracted RTL features.

## Overview
This project extracts key structural and logical features from Verilog files and trains an ML model to predict combinational depth. The approach eliminates the need for full synthesis, making depth estimation faster and more efficient.

## Methodology

### 1. Feature Extraction
- Analyze RTL files to extract key components:
  - Logic gates (AND, OR, XOR, NAND, NOR, etc.)
  - Flip-flops, input/output ports, assignments, and always blocks
- Generate **timing and netlist reports** using **Vivado** to obtain:
  - **Combinational Depth**
  - **Datapath Delay**
  - **Slack**
- Store extracted features in a structured dataset

### 2. Dataset Creation
- Generate a dataset by extracting features from multiple RTL designs
- Associate each design with its known combinational depth

### 3. Model Training
- Use a **Random Forest Regressor** to learn patterns between extracted features and combinational depth
- Perform a train-test split to evaluate model performance

### 4. Prediction Process
- Extract features from a new RTL file
- Use the trained model to estimate its combinational depth

### 5. Error Analysis
- Compute the absolute error between predicted and actual depths
- Identify the worst-case predictions to refine the model

## Approach

### 1. Extract Features from RTL Files
- Parse RTL files and count logical elements:
  - AND, OR, XOR, NAND, NOR, etc.
- Identify structural components such as always blocks, flip-flops, and assignments
- Extract **datapath delay and slack** from **Vivado's timing report**
- Extract **gate types and structure** from **Vivado's netlist report**

### 2. Train the Machine Learning Model
- Use **Random Forest Regressor** for training
- Perform **train-test split** and evaluate performance

### 3. Make Predictions
- Extract features from new RTL files
- Feed extracted features into the trained model for depth estimation

### 4. Error Analysis
- Compute **absolute error** between predicted and actual depths
- Identify **worst predictions** and refine the model

## Error Analysis
The error analysis step compares predicted and actual combinational depths using absolute error calculations. The worst predictions are identified to improve the model further. The `error_analysis.py` script evaluates model accuracy and generates `error_analysis_report.csv` for further analysis.

## ML Trained Model for Prediction
- The trained model (`depth_prediction_model.pkl`) is used to predict combinational depth based on extracted RTL features.
- The `predict_depth.py` script loads this model, processes new RTL files, and outputs the estimated combinational depth.
