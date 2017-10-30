#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
function(input, output, session) {

  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    mtcars[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  
  output$plot1 <- renderPlot({
    palette(c("#B287A3", "#ECCE8E", "#5F787A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999","#BDCFB5"))
    

    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 1, cex = 3, lwd = 2.5)
    
    
  })
  output$txtout <- renderText({
    paste(input$clusters, "clusters", "-", "xvariable" ,input$xcol,"and", "yvariable",input$ycol)})
  
}


