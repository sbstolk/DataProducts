## Load shiny library
library(shiny)
## Standard shinyserver function to caculate the outputs to be displayed
shinyServer(
  function(input, output) {
    ## Render the input temperature
    output$text_input_temperature <- renderText({
      input_temperature()
    })
    ## To find the input units from radio button values
    input_temperature <- reactive({
      if(input$type == 1)
        input_temperature <- paste(input$slider_temperature, "Celsius")
      else
        input_temperature <- paste(input$slider_temperature, "Fahrenheit")
    })
    ## Calculate and render the output temperature with units
    converted <- reactive({
      if(input$type == 1)
        converted <- paste(ctof(input$slider_temperature), "Fahrenheit")
      else
        converted <- paste(ftoc(input$slider_temperature), "Celsius")
    })
    output$text_output_temperature <- renderText({
      converted()
    })
    ## Function to convert Celsius to Fahrenheit
    ctof <- function(c)
    {
      (c * 9)/5 + 32
    }
    ## Function to convert Fahrenheit to Celsius
    ftoc <- function(f)
    {
      (f - 32) * 5/9
    }
  }
)
