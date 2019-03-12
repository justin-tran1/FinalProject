library(knitr)
library(dplyr)
library(ggplot2)
library(ggjoy)
library(lintr)
library(styler)
library(leaflet)
library(jsonlite)
library(rlang)
library(devtools)
library(httr)
library(spotifyr)
library(ggjoy)
library(httr)
library(leaflet)
library(ggmap)
library(tibble)
library(DataCombine)
library(tidyverse)





source("api-keys.R")


# Sample API Calls 

# Assembling URL 


#Create an access token via the code below, which can be recognized and read 
#from the built in functions for the Spotify library. 


<<<<<<< HEAD
access_token <- get_spotify_access_token()
=======

access_token <- get_spotify_access_token()


>>>>>>> 608c224ad1f79e793baf274882257773d826c31b

#get_artist_audio_features is a built in function of the SpotifyR library 


<<<<<<< HEAD
test_pull <- get_artist_audio_features('Soundgarden')
                                       

sg_valence <- test_pull %>% 
=======
<<<<<<< HEAD
pull <- get_artist_audio_features("Eminem")
=======
test_pull <- get_artist_audio_features('Chris Cornell',"HK")
                                       

                                      

>>>>>>> 608c224ad1f79e793baf274882257773d826c31b

  pull %>% 
>>>>>>> e975c6d724b1b4ae2ef9f24b9ad779e2509e0da7
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(5) %>% 
  kable()


#You need to install the ggjoy package for the visualization below to work. 

<<<<<<< HEAD
ggplot(sg_valence, aes(x = valence, y = album_name)) + 
=======
<<<<<<< HEAD
ggplot(pull, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Eminem's joy distributions", 
          subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")
=======
ggplot(test_pull, aes(x = valence, y = song)) + 
>>>>>>> e975c6d724b1b4ae2ef9f24b9ad779e2509e0da7
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Soundgarden's joy distributions", 
          subtitle = "Based on valence pulled from 
          Spotify's Web API with spotifyr")




ggplot(sg_valence, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Soundgarden's joy distributions", 
          subtitle = "Based on valence pulled from 
          Spotify's Web API with spotifyr")







test_pull %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(5) %>% 
  kable()


ggplot(test_pull, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Joy Division's joy distributions", 
          subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")









test_aa <- get_artist_audio_features("Victor Wooten")




sg <- "5xUf6j4upBrXZPg6AI4MRK"




api_sp <- GET(https://api.spotify.com/v1/artists/0OdUWJ0sBjDrqHygGUXeCF" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer BQCt2ZTi_FBwccDi0s4aWVquX9VjIkljcYjlEKeXII-tvs31oersjhumQ4pKtk4K8Fjb7qmhWBkyiseYwCUrSQ5miAOjCufpw6EjFowAmkiPk63VlS0w7AE9sBqgkv1p36NY3j5v056S4MeTrKoH)




endpoint_sp <- api.spotify.com/v1/artists/{sg}


h <- GET(api.spotify.com/v1/search?q=tania%20bowra&type=artist" 
"Authorization: Bearer {access_token})





id_secret<-RCurl::base64(paste(client_id,client_secret,sep=':'))


my_headers<-httr::add_headers(c(Authorization=paste('Basic',id_secret,sep=' ')))


my_body<-list(grant_type='client_credentials')

my_token<-httr::content(httr::POST('https://accounts.spotify.com/api/token',
                                   my_headers,body=my_body,encode='form'))


auth_header<-httr::add_headers('Authorization'=paste('Bearer',my_token$access_token))

track_id <- "4ePl0meknOkJ892O9yszEY"


sg_track <- httr::content(httr::GET(paste('https://api.spotify.com/v1/audio-features/', 
                                    track_id, sep=''),auth_header))

>>>>>>> 608c224ad1f79e793baf274882257773d826c31b


sg_band <- httr::content(httr::GET(paste('https://api.spotify.com/v1/artists/',
                                    sg,sep=''),auth_header))




https://api.spotify.com/v1/artists/{id}/related-artists


sg_related <- httr::content(httr::GET(paste0('https://api.spotify.com/v1/artists/',
                                         sg,"/related-artists",sep=''),auth_header))


sg_related <- httr::content(httr::GET(paste('https://api.spotify.com/v1/artists/related-artists',
                                    sg, sep=''),auth_header))


body <- fromJSON(content(sg_band, "text"))



radiohead <- get_artists("Radiohead")





joy <- get_artist_audio_features('joy division')

joy %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(5) %>% 
  kable()


ggplot(joy, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Joy Division's joy distributions", 
          subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")



