library(shiny)
shinyUI(pageWithSidebar(
  headerPanel('Developing Data Products'),
  sidebarPanel(
    h3('Instructions'),
    p('Enter you car`s mileage and its no. of cylinders. The engine displacement is predicted below'),
    h3('Please enter predictors.'),
    numericInput('hwy', 'Highway miles:', 10, min = 5, max = 20, step = 1),
    numericInput('cty', 'City miles:', 7, min = 5, max = 15, step = 1), 
    numericInput('cyl', 'No. of cylinders:', 4, min = 4, max = 8, step = 2)
  ),
  mainPanel(
    h6('Course Project by Gouthami'),
    h3('Predicting Engine displacement'),
    h4('You entered:'),
    verbatimTextOutput("inputValues"),
    h4('giving:'),
    verbatimTextOutput("prediction"),
    h3('Method'),
    p('In this simple project, the engine displacement is linearly regressed against mileage in city and highway. It is then used to predict information for any new input values')
    )
  ))
