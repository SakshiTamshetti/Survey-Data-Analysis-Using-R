
# 📊 Survey-Data-Analysis-Using-R
## 📝 Overview

This R project performs a comprehensive analysis of customer survey data, focusing on:

- Agent ratings  
- Delivery times  
- Order types  
- Customer feedback categories  

It processes the raw data, computes essential statistics, generates meaningful visualizations, and exports both a summary report and the cleaned dataset for further use.

---

## 📁 Output Directory

All outputs are saved to the following location:
~/Downloads/Survey_Analysis_Graphs/
![Screenshot (2)](https://github.com/user-attachments/assets/2f3f66b2-942e-4b0b-ac87-eb7de2f75af2)


---

## ✅ Features

### 📌 Data Selection & Filtering

- Selects relevant columns including `Agent Name`, `Rating`, `Delivery Time`, and `Feedback`
- Filters include:
  - High-rated reviews (Rating ≥ 4)
  - Negative customer feedback entries

### 📊 Statistical Summary

- Computes:
  - Mean rating
  - Median rating
  - Variance in ratings
  - Delivery time range
- Output saved as: `summary_report.txt`

### 📈 Visualizations

- 🟦 **Bar Plot:** Order count by location
- 🟧 **Histogram:** Delivery time distribution
- 🟩 **Box Plot:** Ratings across different order types
- 🟪 **Pie Chart:** Customer feedback distribution

All visualizations are saved as `.png` files for easy sharing and inclusion in reports.

### 🏷 Rating Classification

- Ratings are classified into:
  - **High** (≥ 4)
  - **Medium** (2.5 to 3.9)
  - **Low** (< 2.5)

### 💾 Data Export

- The final processed dataset (including the new rating labels) is saved as:  
  `processed_survey_data.csv`

---

## 🖼️ Example Plots

- `barplot_orders_by_location.png`  
- `histogram_delivery_time.png`  
- `boxplot_rating_by_order_type.png`  
- `piechart_feedback_distribution.png`  

---

## 🔧 Requirements

Please install the required R packages before running the script:

install.packages("dplyr")
install.packages("ggplot2")

## Execution
#### Update the file path in the script to match the location of your survey CSV file on your system. Locate this line in the R script:

>  read.csv("E:/projects/R_project/survey.csv")

- Change the path to point to your own file location. For example:

 > read.csv("C:/Users/YourUsername/Documents/SurveyData/survey.csv")

- Run the script in R or RStudio by executing the following command:

> source("E:/projects/R_project/Survey_Data_Analysis.R")

This will process the data, generate plots, and export results to the Survey_Analysis_Graphs folder.
After execution, find all the generated files in your Downloads folder: 

> C:/Users/YourUsername/Downloads/Survey_Analysis_Graphs/


