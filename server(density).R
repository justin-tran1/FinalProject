library(knitr)
library(dplyr)
library(ggplot2)
library(lintr)
library(styler)
library(leaflet)
library(jsonlite)
library(rlang)
library(devtools)
library(httr)
library(spotifyr) 
library(ggjoy)
library(tidyr)
library(stringr)
library(DataCombine)
library(rsconnect)
library(plotly)
library(shiny)


source("ui(density_plot).R")





shinyServer(function(input, output) {
  
  
  # create the variables that are used to generate the drop down menus for the
  # x and y variables.
  
  
  # Usijng the render plot feature to actually display the plot on the web
  # page.
  
  output$music_density <- renderPlot({
    
    x_global <- global_data[[input$x_music_variables]]
    x_brazil <- brazil_data[[input$x_music_variables]]
    x_japan <- japan_data[[input$x_music_variables]]
    x_uk <- uk_data[[input$x_music_variables]]
    x_us <- usa_data[[input$x_music_variables]]
    
    
    
    # Using ggplot to generate a density plot
    
    
    
   music_density_plot <- ggplot(data = global_data, aes(x = x_global, color = "Global"), 
                                fill = "x_global")+
      geom_density(alpha = 0.2) + 
      geom_density(data = brazil_data, aes(x = x_brazil, color = "Brazil"))+
      geom_density(data = japan_data, aes(x = x_japan, color = "Japan"))+
      geom_density(data = uk_data,  aes(x = x_uk, color = "United Kingom"))+
      geom_density(data = usa_data, aes(x = x_us, color = "United States"))+
     labs(title="Density distributions of various music features",
          x="September 2017 - December 2018", y = "Density")+
     scale_colour_manual("Legend", values = c("Black", "Red", "Blue", "Dark Green", "Purple"))
    
    return(music_density_plot)

    
    })

})




