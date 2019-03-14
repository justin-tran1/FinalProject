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

america <- read.csv("data_averages/updated_files/usa_data(revised).csv", stringsAsFactors = F)
japan <- read.csv("data_averages/updated_files/japan_averages(revised).csv", stringsAsFactors = F)
britain <- read.csv("data_averages/updated_files/uk_averages(revised).csv", stringsAsFactors = F)
brazil <- read.csv("data_averages/updated_files/brazil_averages(revised).csv", stringsAsFactors = F)
global <- read.csv("data_averages/updated_files/global_data(revised).csv", stringsAsFactors = F)


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

x_choices <- colnames(global_data[2:10])


ui <- navbarPage(theme = 'bootstrap.css', #inspired by third-party UI design website https://bootswatch.com/ to integrate CSS elements into app.
  "Emotions, Global Cultures and Music", #Bootstrap themes are released under the MIT License and maintained by the community on GitHub.
  
  
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
        tags$style(type="text/css",
                   ".shiny-output-error { visibility: hidden; }",
                   ".shiny-output-error:before { visibility: hidden; }"),

        (plotOutput("chart")),
        h2('Some trends we noticed'),
        h3("We looked up the valence data for the top 5 artists globally right now. Here's what we found:"),
        p(" - Drake, the world's most popular artist in 2018, seems to have a common trend amongst his albums. All of his most popular albums have an almost identical valence value at 0.3, making his music scientificaly 'neutral-sad', but only just! Research says that neutral music tends to be more popular due to its ability to appeal to a broad audience."),
        p(" - Ed Sheeran, another extremely popular artist, seems to take a different strategy than Drake. His albums are diverse when compared to each other, but interestingly, each album seems to have it's own theme that all the tracks follow. For example, his album '+' had a very strong surge at 0.56 Valence, and almost none of the tracks in that album were outside the 1st standard deviation. "),
        p(" - Unsurprisingly, global K-Pop sensation 'BTS' had extremely high valence values across their albums, with their general theme being upbeat, positive music.")
        
        
    
        
        
      )
    )
  ),
  tabPanel(
    "Culture-Specific Preferences",
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "countryname",
          h3("Select location"),
          list("Japan", "America", "Britain", "Brazil", "Global")
        )
      ),
      mainPanel(
        plotlyOutput("chart2"),
        plotlyOutput("chart3"),
        plotlyOutput("chart4")
        
      )
    )
  ),
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
         label = h3("Select Music Features"),
         choices = x_choices,
         selected = "avg_valence"
       )
     ),
     
     mainPanel(
       
       # Function that will generate the plot in the shiny app
       plotOutput("music_density"),
       
       h3("These density plots compare the distribution of the average values
           of the selected musical element, for the Spotify top 25 charts from 
          September 2017 through December 2018. The values were calculated by 
           taking the top 25 songs at the end of each month from the Spotify
           charts web site, and then running them through the Spotify API
           to get the musical features ranging from tempo, to valence and energy."),
       p('These density plots are a visual depiction of the average selected values of valence, danceability, tempo, etc., over the time period spanning September 2017 through December 2018 on a global and regional basis (Brazil, Great Britain, Japan and The United States).'),
         p('The data comes from the Spotify top 25 chart for the last week of the month for each region. Averages are used to treat each chart as a snapshot of musical tastes, the emotions elicited by the music and the musical elements that are most resonating with people. The global and regional comparisons are used to determine if there are any major differences between country or the global and country level charts.'),
       h3("What did we notice?"), 
       h5('The density plot findings for valence, a measure of the positive or negative emotions stimulated by a song, showed that:'),
       p(' - Brazilian charts were dominated by positive music, clustered around the 0.7 valence value'),
       p( '- The American charts were dominated by sadder songs, as they were clustered around 0.43.'),
       p( " - The UK enjoys its mopey music too! It's most popular music was clustered around the 0.46 value"),
       p(''),
       h3("That's cool, but what else?"),
       h5("Here's some other intriguing findings we made using our data;"),
       p('- Japan does not enjoy non-melodic vocals in their music at all, with almost all their popular music having a speechiness value of approx. 0.07'),
       p('- The US really likes to dance, with a significant majority of their popular music having a very high danceability value (0.8)'),
       p(' - Brazil enjoys its music fast and pacey, with extremely high tempo values for a significant majority of their popular music (peaks at 130bpm and 140bpm)')
       
       
       
       
     )
   )
 )
)


