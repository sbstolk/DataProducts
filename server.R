palette(c("#4f37b8", "#21905b", "#21d4e3", "#8e78a5", "#2393e7"))
shinyServer(function(input, output, session) {
 selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
})

