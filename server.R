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

america <- read.csv("data_averages/America_data.csv", stringsAsFactors = F)
japan <- read.csv("data_averages/japan_data.csv", stringsAsFactors = F)
britain <- read.csv("data_averages/GreatBritain_data.csv", stringsAsFactors = F)

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
  })


  variable <- reactive({
    if (input$varname == "Average Danceability") {
      avg_danceability
    }
    else if (input$varname == "Average Energy") {
      avg_energy
    }
    else if (input$varname == "Average Loudness") {
      avg_loudness
    }
    else if (input$varname == "Average Speechiness") {
      avg_speechiness
    }
    else if (input$varname == "Average Acousticness") {
      avg_acoustisness
    }
    else if (input$varname == "Average Instrumentalness") {
      avg_instrumentalnes
    }
    else if (input$varname == "Average Liveliness") {
      avg_liveness
    }
    else if (input$varname == "Average Valence") {
      avg_valence
    }
    else if (input$varname == "Average Tempo") {
      avg_tempo
    }
  })

  output$chart <- renderPlot({
    ggplot(
      artist_use(),
      aes(x = valence, y = album_name, fill = album_name)
    ) +
      geom_joy() +
      theme_light() +
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
      aes(x = date, y = avg_valence, color = avg_valence)
    ) +
      geom_point() +
      geom_line() +
      theme_light() +
      labs(x = "Date", y = "Average Valence") +
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
      aes(x = date, y = avg_tempo, color = avg_tempo)
    ) +
      geom_point() +
      geom_line() +
      theme_light() +
      labs(x = "Date", y = "Average Tempo") +
      ggtitle(
        paste(
          input$countryname, "Average Tempo over time"
        ),
        "Based on data pulled from Spotify's Web API"
      )
    ggplotly(test_3)
  })
}
