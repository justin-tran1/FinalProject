library(knitr)
library(dplyr)
library(ggplot2)
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

source("api-keys.R")


# Sample API Calls 

# Assembling URL 


#Create an access token via the code below, which can be recognized and read 
#from the built in functions for the Spotify library. 


access_token <- get_spotify_access_token(client_id, client_secret)

#get_artist_audio_features is a built in function of the SpotifyR library 


test_pull <- get_artist_audio_features('Soundgarden')

test_pull %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(10)


#You need to install the ggjoy package for the visualization below to work. 

ggplot(test_pull, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Soundgarden's joy distributions", 
          subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")








