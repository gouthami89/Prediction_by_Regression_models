library(shiny)
library(caret)
library(e1071)
library(dplyr)

data("mpg")

m1 <- lm(displ ~ hwy + cty + cyl, data=mpg)

pclass <- function(hwy, cty, cyl) {
  m1$coefficients[1]*hwy + m1$coefficients[2]*cty + m1$coefficients[3]*cyl
}

shinyServer(
  function(input, output) {
    predicted_class <- reactive({pclass(input$hwy, input$cty, input$cyl)})
    output$inputValues <- renderPrint({paste(input$hwy, "Highway miles per gallon, ",
                                             input$cty, "City miles per gallon, ",
                                             input$cyl, "Number of cylinders")})
    output$prediction <- renderPrint({paste(round(predicted_class()), "miles per gallon")})
    
  }
)