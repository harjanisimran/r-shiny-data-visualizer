
server <- function(input, output, session) {
  data_graph1 <- reactive({
    req(input$upload_graph1)
    
    ext <- tools::file_ext(input$upload_graph1$name)
    switch(ext,
           csv = vroom::vroom(input$upload_graph1$datapath, delim = ","),
           tsv = vroom::vroom(input$upload_graph1$datapath, delim = "\t"),
           xlsx= read_excel(input$upload_graph1$datapath),
           validate("Invalid file; Please upload a .csv, .xlsx or .tsv file")
    )
  })
  observeEvent(input$upload_graph1, {
    updateSelectInput(session,
                      'xvar_graph1',
                      choices=colnames(data_graph1())
    )
    updateSelectInput(session,
                      'yvar_graph1',
                      choices=colnames(data_graph1())
    )
    
    updateSelectInput(session,
                      'sizevar_graph1',
                      choices=colnames(data_graph1())
    )})                 
  
  
  
  output$display_data_graph1 <- renderDataTable({
    data_graph1()
  })
  output$graph1 <- renderPlotly({
    data <- data_graph1()
    xvar <- input$xvar_graph1
    yvar <- input$yvar_graph1
    graph_title <- input$title_graph1
    graph_type <- input$type_graph1
    sizevar <- input$sizevar_graph1
    
    # Common axis labels
    xlabel <- ifelse(input$xlabel_graph1 != "", input$xlabel_graph1, xvar)
    ylabel <- ifelse(input$ylabel_graph1 != "", input$ylabel_graph1, yvar)
    
    if (graph_type == 'scatter') {
      plot_ly(data = data,
              x = ~get(xvar),
              y = ~get(yvar),
              type = graph_type,
              mode = 'markers') %>%
        layout(
          title = graph_title,
          xaxis = list(
            title = xlabel,
            titlefont = list(size = 18)
            
          ),
          yaxis = list(
            title = ylabel,
            titlefont = list(size = 18)
          )
        )
    }
    else if (graph_type == 'box') {
      plot_ly(data = data,
              x = ~get(xvar),
              y = ~get(yvar),
              type = graph_type,
              boxmean = TRUE) %>%
        layout(
          title = graph_title,
          xaxis = list(
            title = xlabel,
            titlefont = list(size = 18)
            
          ),
          yaxis = list(
            title = ylabel,
            titlefont = list(size = 18)
        
          )
        )
    }
    else if (graph_type == 'bubble') {
      plot_ly(data = data,
              x = ~get(xvar),
              y = ~get(yvar),
              type = 'scatter',
              mode = 'markers',
              size = ~get(sizevar)) %>%
        layout(
          title = graph_title,
          xaxis = list(
            title = xlabel,
            titlefont = list(size = 18)
          ),
          yaxis = list(
            title = ylabel,
            titlefont = list(size = 18)
          )
        )
    }
    else if (graph_type == 'bar') {
      plot_ly(data = data,
              x = ~get(xvar),
              y = ~get(yvar),
              type = 'bar') %>%
        layout(
          title = graph_title,
          xaxis = list(
            title = xlabel,
            titlefont = list(size = 18)
          ),
          yaxis = list(
            title = ylabel,
            titlefont = list(size = 18)
          )
        )
    }
  })
}