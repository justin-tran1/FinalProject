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


server <- function(input, output) {
  artist_use <- reactive({
    get_artist_audio_features(input$artistname) 
  })

  output$chart <- renderPlot({
    ggplot(artist_use(), aes(x = valence, y = album_name, fill = album_name)) +
      geom_joy() +
      theme_joy() +
      labs(x = input$artistname, y = "Album name") + 
      ggtitle(
        paste(
          "Joyplot of", input$artistname, "joy distributions"
          ),
        "Based on valence data pulled from Spotify's Web API with spotifyr"
      )
  })
}
