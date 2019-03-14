library(knitr)
library(dplyr)
library(ggplot2)
library(plotly)
library(lintr)
library(styler)
library(leaflet)
library(jsonlite)
library(rlang)
library(devtools)
library(Rspotify)
library(httr)
library(spotifyr)
library(ggjoy)

Sys.setenv(SPOTIFY_CLIENT_ID = "dff090c9a456431a98b5eef00145e487")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "924d43f14b574ee2bf2b6fbce9d021f9")
access_token <- get_spotify_access_token()

source("ui.R")

america <- read.csv("data_averages/updated_files/usa_data(revised).csv", stringsAsFactors = F)
japan <- read.csv("data_averages/updated_files/japan_averages(revised).csv", stringsAsFactors = F)
britain <- read.csv("data_averages/updated_files/uk_averages(revised).csv", stringsAsFactors = F)
global <- read.csv("data_averages/updated_files/global_data(revised).csv", stringsAsFactors = F)
brazil <- read.csv("data_averages/updated_files/brazil_averages(revised).csv", stringsAsFactors = F)


server <- function(input, output) {
  artist_use <- reactive({
    get_artist_audio_features(input$artistname)
  })

  good <- reactive({
    if (input$countryname == "America") {
      america
    }
    else if (input$countryname == "Japan") {
      japan
    }
    else if (input$countryname == "Britain") {
      britain
    }
    else if (input$countryname == "Brazil") {
      brazil
    }
    else if (input$countryname == "Global") {
      global
    }
  })

  output$chart <- renderPlot({
    ggplot(
      artist_use(),
      aes(x = valence, y = album_name, fill = album_name)
    ) +
      geom_joy() +
      theme_dark() +
      labs(x = input$artistname, y = "Album Name") +
      ggtitle(
        paste(
          "Joyplot of", input$artistname, "Valence Distributions"
        ),
        "Based on valence data pulled from Spotify's Web API with spotifyr"
      )
  })

  output$chart2 <- renderPlotly({
    test <- ggplot(
      good(),
      aes(x = date, y = avg_valence, color = -avg_valence)
    ) +
      geom_point() +
      geom_smooth() +
      theme_grey() +
      labs(x = "Date", y = "Average Valence", color = "Valence (0.0 - 1.0)") +
      ggtitle(
        paste(
          input$countryname, "Average Valence over time"
        ),
        "Based on data pulled from Spotify's Web API"
      )
    ggplotly(test)
  })
  
  output$chart3 <- renderPlotly({
    test_3 <- ggplot(
      good(),
      aes(x = date, y = avg_tempo, color = -avg_tempo)
    ) +
      geom_point() +
      geom_line() +
      theme_grey() +
      #theme(legend.position="none") +
      labs(x = "Date", y = "Average Tempo", color = "Tempo (BPM)") +
      ggtitle(
        paste(
          input$countryname, "Average Tempo over time"
        ),
        "Based on data pulled from Spotify's Web API"
      )
    ggplotly(test_3)
  })
  output$chart4 <- renderPlotly({
    test_4 <- ggplot(
      good(),
      aes(x = date, y = avg_danceability, color = -avg_danceability)
    ) +
      geom_point() +
      geom_smooth() +
      theme_grey() +
      labs(x = "Date", y = "Average Danceability", color = "Danceability (0.0 - 1.0)") +
      ggtitle(
        paste(
          input$countryname, "Average Danceability over time"
        ),
        "Based on data pulled from Spotify's Web API"
      )
    ggplotly(test_4)
  })
  
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
  
}
