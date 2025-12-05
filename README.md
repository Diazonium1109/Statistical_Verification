# Detecting Data Fabrication in Economic Datasets using Benford’s Law

**A Statistical Verification of GDP Anomalies in Climate-Economic Modeling**

![Status](https://img.shields.io/badge/Status-Completed-success)
![Language](https://img.shields.io/badge/Language-R-blue)
![Method](https://img.shields.io/badge/Method-Benford's_Law-orange)

## 📌 Project Overview
This project is a statistical verification study aimed at detecting data anomalies in macroeconomic reporting. Using **Benford's Law** (the Law of Anomalous Numbers), I analyzed the reported Gross Domestic Product (GDP) figures of **Uzbekistan** from 1990 to 2023.

The study compares local economic data against a **Global Control Group** to statistically validate claims of data fabrication or artificial smoothing, which were recently highlighted in critical climate-economic literature.

## 🔍 Motivation
The inspiration for this project stems from a scientific debate between two major climate-economic studies:
1.  **Kotz et al. (2024):** Modeled global economic commitment to climate change.
2.  **Hsiang et al. (2025):** Critiqued the former, arguing that "erroneous" GDP data from Uzbekistan skewed global estimates due to implausible year-to-year swings.

**Objective:** To move beyond qualitative critique and use independent statistical testing to empirically verify if Uzbekistan's data exhibits non-natural artifacts.

## 📂 Repository Structure

### 1. `Statistical_Verification/`
This folder contains the core technical work of the project.
* `benford_analysis.R`: The R script used to extract leading digits, calculate frequencies, and generate comparison plots.
* `API NY . GDP . MKTP . CD DS2 en csv v2 2463.csv`: The raw dataset sourced from the World Bank (1960-2023).
* `Verification_Report.pdf`: The formal LaTeX report detailing the methodology, code, and mathematical conclusion.
* `Rplot.png`: The generated visualization comparing Uzbekistan vs. Global data.

### 2. `Original_Critique/`
This folder contains the preliminary academic work.
* `Summary Report - Kotz, el.pdf`: A summary report analyzing the *Kotz vs. Hsiang* debate, which served as the hypothesis generator for this verification project.

## 📊 Key Findings

The analysis yielded a statistically significant distinction between the Global Average and the Uzbekistan dataset:

* **Global Control Group:** Closely adhered to the theoretical Benford's Law curve (Digit 1 $\approx$ 30%), confirming that aggregate economic data follows natural laws.
* **Uzbekistan Data:** Exhibited severe deviations:
    * **Digit 1 Over-representation:** Appeared in **>51%** of cases (vs. ~30% expected).
    * **Missing Digits:** Digits 2, 3, and 4 were statistically under-represented.
    * **Anomalous Spikes:** Unnatural peaks were observed at digits 6 and 8.

### Visualization
*(See `Statistical_Verification/Rplot.png` for the full high-res chart)*

> The stark contrast between the global control group (grey) and the target country (orange) suggests that the Uzbekistan dataset likely contains non-natural artifacts, supporting the hypothesis of manual data smoothing.

## 🛠️ Tools & Methodology
* **Language:** R (Base R for data processing).
* **Libraries:** `ggplot2` for visualization.
* **Data Source:** World Bank Open Data (Indicator: `NY.GDP.MKTP.CD`).
* **Statistical Test:** Leading Digit Frequency Analysis (Benford’s Law).

## 🚀 How to Run the Code
1.  Clone this repository:
    ```bash
    git clone [https://github.com/Diazonium1109/Benford-Law-Verification.git](https://github.com/Diazonium1109/Benford-Law-Verification.git)
    ```
2.  Open `Statistical_Verification/benford_analysis.R` in RStudio.
3.  Ensure `API NY . GDP . MKTP . CD DS2 en csv v2 2463.csv` is in the working directory.
4.  Run the script to reproduce the analysis and generate the plot.

## 👤 Author
**Utkarsh Bharadwaj**
* Bachelor of Statistical Data Science
* Indian Statistical Institute, Bangalore
* [LinkedIn Profile](https://linkedin.com/in/utkarsh-bharadwaj/)

---
*This project was conducted as part of an independent statistical inquiry inspired by coursework at ISI Bangalore.*
