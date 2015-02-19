
library(shiny)
library(datasets)
shinyUI(
  fluidPage(    
    titlePanel("Air Quality Measures"),
    sidebarLayout(      
      sidebarPanel(
        selectInput("xcol", "Quality Measure:", 
                    choices=colnames(airquality)),
        hr(),
        helpText("Daily air quality measurements in New York, May to September 1973.")
      ),
            mainPanel(
        plotOutput("AirPlot")  
      )
      
    )
  )
)

