library(ggvis)
data(mtcars)

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    
    validate(need(1 == 2,str(input$variable))
    )

   mtcars[input$variable]
  })
  
  svd_comp <- reactive({
    selected_data_scaled <- scale(selectedData())
    principle_comps <- princomp(selected_data_scaled)$scores[,0:2]
    principle_comps <- as.data.frame(principle_comps)
    names(principle_comps) <- c('Component_1','Component_2')    
    principle_comps
  })
  
  clusters <- reactive({
    kmeans(svd_comp(), input$clusters)
  })
  
  tooltip <- function(x){
    #row.names(mtcars)[x]
    paste('<b>',x$carname,'</b>')
  }
  
  vis <- reactive({   
    
    df <- svd_comp()
    df$carname <- rownames(mtcars)
    df$cluster <- as.factor(clusters()$cluster)    
    
    df %>%
    ggvis(x=~Component_1,y=~Component_2, fill = ~cluster) %>% 
      layer_points(key:=~carname) %>%
      add_tooltip(tooltip, "hover")
  })
  vis %>% bind_shiny('plot1')
})