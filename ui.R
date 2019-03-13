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
library(shiny)



Sys.setenv(SPOTIFY_CLIENT_ID = "dff090c9a456431a98b5eef00145e487")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "924d43f14b574ee2bf2b6fbce9d021f9")
access_token <- get_spotify_access_token()

country <- read.csv("data_averages/japan_data.csv", stringsAsFactors = F)



ui <- navbarPage(
  "Spotify INFO 201",
  tabPanel(
    img(
      " About", 
      src = "logo.jpg", 
      width = "40px", 
      height = "40px"
      ),
    sidebarLayout(
      img(src = "logo.jpg", width = "600px", height = "600px"),
      mainPanel(
        h1("About"),
        p("Spotify is a major music streaming platform available on almost all
          devices. With hundreds of millions of users, Spotify collects a lot
          of data on users and their listening habits. With the Spotify API,
          Spotify shares much of its findings with the community. Many insights
          can be made with the data provided through the API. Much of the
          findings of the API are can be cleaned up and be useful to a 
          wide range of people, including but not limited to free users, 
          subscription-paying members, Spotify employees, shareholders, 
          artists, distributors, music industrial analysts, music industry 
          executives, artist-specific executives, artist managers/agents and 
          anyone involved with the music creation process. The following data
          is made possible with the Spotify API, the Spotifyr package, and R."
          ),
        h2("The valence of albums"),
        p("Using the Spotify API, this site plots the average valence of an
          artist on a joyplot. This allows users to see an artists \"happiest\"
          or \"saddest\" album."
          ),
        h2("Placeholder"),
        p("Placeholder"),
        
        h2("Questions that can be answered"),
        p("Using the Spotify API, executives and producers can focus their
          marketing efforts on what has proven to be successful in the past.
          Likewise, people can see all the successful songs/albums and attempt
          to replicate that success.        
          In a more detailed example, recognizing the valence of an album can 
          be useful to an artist in many ways. One possible insight that is 
          relevant to an artist is which of their albums sell more, albums 
          with a high valence (happier albums) or albums with a low valence 
          (sadder albums). With this knowledge, in the future an artist can 
          create music that has a higher change of selling well."
          )
        
      )
    )
  ),
  tabPanel(
    img(
      " Valence of an artists albums", 
      src = "smile.png", 
      width = "40px", 
      height = "40px"
      ),
    sidebarLayout(
      sidebarPanel(
        h1("Choose an artist (should work for most major artists)"),
        textInput(
          "artistname",
          "Enter the name of an artist",
          "Beatles"
        ),
        p(
          "The average 'valence' of all the songs in an album.
          Valence is defined by Spotify as the musical positiveness conveyed
          by a track. More happy, cheerful, and upbeat songs have a higher
          valence while songs that have more sad, angry, and depressed tones
          have a lower valence. All the songs in an album have a valence value
          and the valence of the album is calculated by the mean of all the 
          songs in the albums valence added together and divided by the
          number of songs. It is presented on a 0.0 to 1.0 scale, with 0.0
          being negative (somber songs) while 1.0 is positive (upbeat songs).
          The peak in the joyplot is the average valence of the album while
          the trails represent the range of valence of the songs in the album."
        )
      ),
      mainPanel(
        plotOutput("chart")
      )
    )
  ),
  tabPanel(
    "Visualisation Two",
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "optionname",
          "Select an option to see",
          colnames(country),
          "avg_valence"
        )
      ),
      mainPanel(
        plotlyOutput("chart2")
      )
    )
  )
)
