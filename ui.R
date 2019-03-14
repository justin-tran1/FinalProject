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
library(rvest)
library(shinyWidgets)


Sys.setenv(SPOTIFY_CLIENT_ID = "dff090c9a456431a98b5eef00145e487")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "924d43f14b574ee2bf2b6fbce9d021f9")
access_token <- get_spotify_access_token()

ui <- navbarPage(theme = 'bootstrap.css', #inspired by third-party UI design website https://bootswatch.com/ to integrate CSS elements into app.
  "Feelings, Emotions and Music", #Bootstrap themes are released under the MIT License and maintained by the community on GitHub.
  tabPanel(
    img(
      "", 
      src = "spotify.ico", 
      width = "30px", 
      height = "30px"
      ),
    sidebarLayout(
      img(src = "logo.png", width = "200px", height = "200px", align = 'left'),
      mainPanel(
        h1("Spotify and it's API"),
        
        p("Spotify is a major music streaming platform available on almost all
          devices. With hundreds of millions of users, Spotify collects a lot
          of data on users and their listening habits. With the Spotify API,
          Spotify shares much of its findings with the community. Many insights
          can be made with the data provided through the API."),
        
        p("Much of the findings of the API are can be cleaned up to be user-friendly and relevant to a 
          wide range of people, including but not limited to free users, 
          subscription-paying members, Spotify employees, shareholders, 
          artists, distributors, music industrial analysts, music industry 
          executives, artist-specific executives, artist managers/agents and 
          anyone involved with the music creation process. The following data
          is made possible with the Spotify API, the Spotifyr package, and R."
          ),
        
        h3("What Is Valence?"),
        
        p("You might remember the  “valence” from high school chemistry. It has to do with how many electrons an atom will lose, gain, or share when it joins with another atom.
Psychologists put a spin on that concept, using the word “valence” to describe whether something is likely to make someone feel happy (positive valence) or sad (negative valence).
It’s sort of like the electron sense of the word. Is an event, situation, or experience going to add to your mood, or detract from it? That’s how you can calculate its emotional valence.
(Spotify Insights, 2013)"),
        
        h3("But How Does A Numerical Value Measure Human Emotion?"),
        
        p("An individuals' reaction to music is emotional. Some of it makes us happy, and some of it makes us sad, with songs falling all across the spectrum between happy and sad.
 It’s no easy feat to have a computer listen to a song in three seconds and determine its emotional valence, but Spotify figured out a way to do exactly that.  A music expert classifies sample songs by valence, then uses machine-learning to extend those rules to all of the rest of the music in the world, fine tuning as time passes. This makes the values more accurate as time passes."),
        
        h3("Questions that can be answered"),
        p("Using our platform and analytics, executives and producers can focus their
          marketing efforts on what has proven to be successful in the past.
          Likewise, people can see all the successful songs/albums and attempt
          to replicate that success."),        
         p("In a more detailed example, recognizing the valence of an album can 
          be useful to an artists in many ways. One possible insight that is 
          relevant to an artist is which of their albums sell more, albums 
          with a high valence (happier albums) or albums with a low valence 
          (sadder albums). 
With this knowledge, An artist can now create music that has a higher change of success and mass popularity; something crucial to the identity of music in popular culture. Valence data is perfect data to refer to
           for new music development; This app will help artists make music that is more likely to be popular by providing never-seen-before musical insights such as
           past and current trends, comparisons, and country-by-country data. Some potential questions include: "
          ),
        h5(" - What mood should my music invoke?"),
        h5(" - I'm going on concert to the United Kingdom and Japan. Which tracks off my total music library should I play in each country?"),
        h5(" - Why is my music so popular in the clubs, but not for more low-key gatherings?")
        
      )
    )
  ),
  tabPanel(
    img(
      " Valence Data"
      ),
    sidebarLayout(
      sidebarPanel(
        h2("Choose An Artist"),
        textInput(
          "artistname",
          h3("Enter The Name Of An Artist"),
          "Beatles"
        ),
        h4("The average 'valence' of all the songs in an album."),
        h4("Valence is defined by Spotify as the musical positiveness conveyed
          by a track. More happy, cheerful, and upbeat songs have a higher
          valence while songs that have more sad, angry, and depressed tones
          have a lower valence." ),
       
 h4("All the songs in an album have a valence value
          and the valence of the album is calculated by the mean of all the 
          songs in the albums valence added together and divided by the
          number of songs. It is presented on a 0.0 to 1.0 scale, with 0.0
          being negative (somber songs) while 1.0 is positive (upbeat songs).
          The peak in the joyplot is the average valence of the album while
          the trails represent the range of valence of the songs in the album."
        )
      ),
      mainPanel(
        (plotOutput("chart")),
       h3('Fun Fact #1'),
       h3('Fun Fact #2'),
       h3('Fun Fact #3'),
       h3('Fun Fact #4')
        
      )
    )
  ),
  tabPanel(
    "Visualisation Two",
    sidebarLayout(
      sidebarPanel(),
      mainPanel(
        
      )
    )
  )
)


