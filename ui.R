library(shiny)
library(datasets)

require(graphics)

shinyUI(
  
  fluidPage(
    titlePanel("Developing Data Products Course Project: MTR Cars Database"),
    
    sidebarLayout(
      
      # input fields/description
      sidebarPanel(
        h3('Input'),
        p('Select the variable to use as a predictor, then the resulting mpg regression model will be plotted'),
        selectInput('x', label='Predictor',
                    selected='cyl',
                    choices=names(mtcars)),
        
        h3('Description & Instructions'),
        p("The 'mtcars' dataset is used to plot the miles per gallon regression model.",
          "First, choose one variable as the predictor",
          "Next, the resulting 'mpg' will be plotted")
      ),
      
      # space for the output and resulting plot
      mainPanel(
        h3('Output'),
        h5(textOutput('text')),
        plotOutput('plot1')
      )
      
    )
    
  ))