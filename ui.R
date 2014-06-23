
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggvis)
data(mtcars)
shinyUI(pageWithSidebar(
  headerPanel('Motor Trend Car Road Tests (mtcars) Data k-means clustering'),
  sidebarPanel(
    checkboxGroupInput("variable", "Variable:",
                       c("Miles/(US) gallon" = "mpg",
                         "Cylinders" = "cyl",
                         "Displacement in cu" = "disp",
                         "Gross horsepower" = "hp",
                         "Transmission" = "am",
                         "Weight (lb/1000)" = 'wt',
                         "Gears" = "gear"
                         ),c('mpg','cyl','disp','hp','am','wt','gear')),
    sliderInput("clusters", "Clusters",
                1,9,3,step = 1)),
  mainPanel(
    ggvisOutput('plot1')
  )
))
  