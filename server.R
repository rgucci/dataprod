library(shiny)
library(ggplot2)

data1 <- mtcars

shinyServer(
  function(input, output) {
    xy <- reactive({
      paste("mpg ~", "as.integer(", input$x,")")
    })
    
    #linear model
    fit <- reactive({
      lm(as.formula(xy()),data=data1)
    })
    
    #label
    output$text <- renderText({
      paste("Data plot of regression Model (", "mpg ~", input$x, ")")
    })
    
    #plot and store in output variable
    output$plot1 <- renderPlot ({
      with(data1, {
        plot(as.formula(xy()),xlab=input$x,ylab="mpg")
        abline(fit(),col="red")
      })
    })
  }
)