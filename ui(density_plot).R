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
library(stringr)
library(DataCombine)
library(rsconnect)
library(plotly)
library(shiny)


#read in data frames that will be used to generate density plots 
japan_data <- read.csv("data_averages/updated_files/japan_averages(revised).csv", 
                       stringsAsFactors = FALSE)

usa_data <- read.csv("data_averages/updated_files/usa_data(revised).csv", 
                     stringsAsFactors = FALSE)

brazil_data <- read.csv("data_averages/updated_files/brazil_averages(revised).csv", 
                        stringsAsFactors = FALSE)

uk_data <- read.csv("data_averages/updated_files/uk_averages(revised).csv", 
                    stringsAsFactors = FALSE)

global_data <- read.csv("data_averages/updated_files/global_data(revised).csv", 
                        stringsAsFactors = FALSE)
  
  

#create vector with x variables to select, only select 2:10 so as to not
#use the date column as a selectable variable. 
x_choices <- colnames(global_data[2:10])

shinyUI(navbarPage(
  "Elements of Music Around the World",
  
  
  # create the first UI tab
  
  tabPanel(
    "Musical Features of The Top 25",
    
    
    titlePanel("Comparing Top 25 Charts"),
    
    # create sidebar layout for the widgets
    
    sidebarLayout(
      
      
      # Side panel for controls
      
      sidebarPanel(
        
        # Creates the drop down menu for the x variables
        
        # Creates the drop down menu for the Y variable
        selectInput(
          "x_music_variables",
          label = "Select Music Features",
          choices = x_choices,
          selected = "avg_valence"
        )
      ),
      
      mainPanel(
        
        # Function that will generate the plot in the shiny app
        plotOutput("music_density")
        
        h3("These density plots compare the distribution of the average values
           of the selected musical element, for the Spotify top 25 charts from 
           September 2017 through December 2018. The values were calculated by 
           taking the top 25 songs at the end of each month from the Spotify
           charts web site, and then running them through the Spotify API
           to get the musical features ranging from tempo, to valence and energy")
        
      )
    )
  )
))









