#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
pageWithSidebar(
  headerPanel('Clustering simulation'),

  sidebarPanel(
    h6("Choise your variables of mtcars dataset and number of clusters"),
    selectInput('xcol', 'X Var', names(mtcars)),
    selectInput('ycol', 'Y Var', names(mtcars),
                selected=names(mtcars)[[2]]),
    sliderInput('clusters', "Choise nr clusters", 1, 10, value = 3),

    h6("mtcars info :"),
    h6("A data frame with 32 observations on 11 variables."),
    h6("mpg : Miles/(US) gallon"),
    h6("cyl: Number of cylinders"),
    h6("disp:Displacement (cu.in.)"),
    h6("hp:Gross horsepower"),
    h6("drat:Rear axle ratio"),
    h6("wt:Weight (1000 lbs)"),
    h6("qsec:1/4 mile time"),
    h6("vs:V/S"),
    h6("am:Transmission (0 = automatic, 1 = manual)"),
    h6("gear:Number of forward gears"),
    h6("carb:Number of carburetors"),
    h6("Note: inspired on cluster shiny (shiny website examples)")
    
  ),
  mainPanel(
   
    h4("Plot of:"),
    verbatimTextOutput("txtout"),
    plotOutput('plot1')
   
  )
)
