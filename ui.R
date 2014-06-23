
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
    checkboxGroupInput("variable", strong("Variable :"),
                       c("Miles/(US) gallon" = "mpg",
                         "Cylinders" = "cyl",
                         "Displacement in cu" = "disp",
                         "Gross horsepower" = "hp",
                         "Transmission" = "am",
                         "Weight (lb/1000)" = 'wt',
                         "Gears" = "gear"
                         ),c('mpg','cyl','disp','hp','am','wt','gear')),
    sliderInput("clusters", strong("Clusters :"),
                2,10,3,step = 1),
    helpText(br(),strong("Instructions:"),br(),"1. Application uses mtcars dataset from the datasets package",
             br(),"2. It takes checked variables as input and  subset the dataset.",
             br(),"3. It ",a("scale",href = "http://en.wikipedia.org/wiki/Feature_scaling")," the data",
             br(),"4. Finds out the ",a("principal components",href = "http://en.wikipedia.org/wiki/Principal_component_analysis"),
             br(),"5. Finds out the clusters on the fist two principal components using", a("knn algorithm",href="http://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm"),
             br(),"On mouse hover on the points car names displayed.",
             br(),br(),
             strong("Note:"),"Application works only if more than 2 variables selected")),
  mainPanel(
    ggvisOutput('plot1')
  )
))
  