#  Project Title:  
**Interactive Shiny Dashboard for Custom Data Analysis**

---

##  Description:
This project showcases an **interactive dashboard built using R and Shiny**, designed to visualize and analyze **user-uploaded datasets**. Whether you're working with `.csv` or `.xlsx` files, the dashboard allows you to filter, summarize, and explore your data with ease—no coding required. It’s a versatile tool for students, educators, analysts, and professionals seeking quick, actionable insights.

---

##  Key Features:
- Upload and analyze any **CSV** or **Excel (XLSX)** file  
- Automatically detects numeric and categorical columns  
- Provides multiple visual outputs:
  - **Scatter plots**  
  - **Box plots**  
  - **Bubble charts**  
  - **Bar charts**  
- Interactive filters for dynamic data exploration  
- Clean, user-friendly interface built in R Shiny  

---
## 📁 Files:
- `app.R` – Combined Shiny app file (can be run independently for full functionality)  
- `global.R` – Initializes the app by loading libraries, shared functions, and default data  
- `ui.R` – Defines the layout and user interface elements of the dashboard  
- `server.R` – Contains the server logic for data handling and rendering outputs  
- `sample_data.csv` – Sample file for upload testing  
- `dashboard_preview.png` – Screenshot of the app interface  
- **Note:** The app also loads **default data (`mtcars`)** for quick visualization when no file is uploaded  
---

##  Requirements:

- **Language:** R  
- **Framework:** Shiny  
- **R Libraries Used:**
  - `shiny` – for building the interactive web app  
  - `plotly` – for creating interactive plots (scatter, box, bubble, bar)  
  - `readxl` – for reading `.xlsx` Excel files  
  - `tidyverse` – for data wrangling and manipulation  
  - `DT` – for rendering interactive data tables  
  - `vroom` – for fast reading of large `.csv` files  
 
---

## 📊 Results:
- Users can upload any `.csv` or `.xlsx` dataset for visualization  
- Real-time interactive charts:
  - Scatter plots for correlation insights  
  - Box plots for distribution analysis  
  - Bubble charts for multi-dimensional data  
  - Bar charts for frequency comparison  
- Filter and explore subsets of data with ease  
- Helps users uncover patterns, outliers, and trends across variables  

---

## 🧾 Conclusion:
This Shiny dashboard offers a **code-free, flexible data analysis tool** that supports a wide variety of visualizations. It's ideal for quick data exploration across industries—whether for research, reporting, or teaching. Fully supports `.csv` and `.xlsx` files.

---

## 👥 Contributors:
- **Simran Harjani** – App development, UI design, and testing
