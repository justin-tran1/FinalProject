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
pull <- get_artist_audio_features("Eminem")
=======
test_pull <- get_artist_audio_features('Chris Cornell',"HK")
                                       

                                      

>>>>>>> 608c224ad1f79e793baf274882257773d826c31b

  pull %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(20)


#You need to install the ggjoy package for the visualization below to work. 

<<<<<<< HEAD
ggplot(pull, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Eminem's joy distributions", 
          subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")
=======
ggplot(test_pull, aes(x = valence, y = song)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Soundgarden's joy distributions", 
          subtitle = "Based on valence pulled from 
          Spotify's Web API with spotifyr")



test_aa <- get_artist_audio_features("Victor Wooten")




sg <- "5xUf6j4upBrXZPg6AI4MRK"




api_sp <- GET(https://api.spotify.com/v1/artists/0OdUWJ0sBjDrqHygGUXeCF" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer BQCt2ZTi_FBwccDi0s4aWVquX9VjIkljcYjlEKeXII-tvs31oersjhumQ4pKtk4K8Fjb7qmhWBkyiseYwCUrSQ5miAOjCufpw6EjFowAmkiPk63VlS0w7AE9sBqgkv1p36NY3j5v056S4MeTrKoH)




endpoint_sp <- api.spotify.com/v1/artists/{sg}


h <- GET(api.spotify.com/v1/search?q=tania%20bowra&type=artist" 
"Authorization: Bearer {access_token})





id_secret<-RCurl::base64(paste(client_id,client_secret,sep=':'))


my_headers<-httr::add_headers(c(Authorization=paste('Basic',id_secret,sep=' ')))


my_body<-list(grant_type='client_credentials')

my_token<-httr::content(httr::POST('https://accounts.spotify.com/api/token',my_headers,body=my_body,encode='form'))


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

