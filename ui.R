

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      body {
        background-color: #f8f9fa; /* Light grey background */
        font-family: 'Segoe UI', sans-serif;
      }
      
      .well, .sidebarPanel {
        background-color: #e9f7fc;
        border: 1px solid #dee2e6;
        border-radius: 10px;
        box-shadow: 2px 2px 10px rgba(0,0,0,0.05);
        padding: 20px;
        margin-top: 20px;
      }

      .tabbable {
        background-color:	#f5f5f5;
        border: 1px solid #dee2e6;
        border-radius: 10px;
        box-shadow: 2px 2px 10px rgba(0,0,0,0.05);
        padding: 15px;
      }

      h2, h4, label {
        color: #343a40;
      }

      .form-control, .selectize-input {
        border-radius: 6px;
        border-color: #ced4da;
      }

      .btn:hover {
        background-color: #0056b3;
      }

      .shiny-input-container {
        margin-bottom: 15px;
      }
  

    "))
  ), 
  
  titlePanel(h2("📊 Interactive Data Visualizer", style = "color: #007bff; font-weight: bold;")),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("upload_graph1", "Upload a CSV, XLSX File"),
      selectInput("xvar_graph1", "Select X Variable", choices = NULL),
      textInput("xlabel_graph1", " X Axis Label", value = ""),  
    
      selectInput("yvar_graph1", "Select Y Variable", choices = NULL),
      textInput("ylabel_graph1", " Y Axis Label", value = ""),  
      
      selectInput('type_graph1', "Select the graph type", choices =c('scatter', 'box','bubble','bar')),
      conditionalPanel(
        condition = "input.type_graph1== 'bubble'", 
        selectInput("sizevar_graph1", "Select size Variable", choices = NULL)),
      textInput("title_graph1", "Write Graph Title")),
    mainPanel(
      tabsetPanel(
        id ="tabset",
        tabPanel ("DATA",
                  value = "Tab1",
                  DT::DTOutput("display_data_graph1")
        ),
        tabPanel ("GRAPH" ,
                  value = "Tab2",
                  plotlyOutput('graph1')
        )  
        
      )
    )
  )
)
