
library(shiny)
library(datasets)
shinyServer(function(input, output) {
  output$AirPlot <- renderPlot({
    barplot(airquality[,input$xcol] 
            main=input$xcol,
            xlab="Observation")
  })
})

