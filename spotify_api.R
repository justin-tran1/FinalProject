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

#Install the spotifyr library here: devtools::install_github('charlie86/spotifyr')
#using the devtools command ensures you get the most up to date version. 


#Go to Spotify.com and create your client ID and client secret from the developer's
#dashboard. https://developer.spotify.com/dashboard/login 


source("api-keys.R") #Create api-keys file to store the API keys. 

#You have to use the client_id and client_secret to generate the authorization
#token, which is a combination of having the keys and pinging Spotify to get the
#token. This is the most difficult part of obtaining data from the API. 


#Run the following lines of code to generate the token. client_id and 
#client_secret are stored in the api-keys file. There is probably a simpler
#way to build the token, but for now, I know the code below works. 


id_secret<-RCurl::base64(paste(client_id, client_secret,sep=':'))


my_headers<-httr::add_headers(c(Authorization=paste('Basic',id_secret,sep=' ')))


my_body<-list(grant_type='client_credentials')

my_token<-httr::content(httr::POST('https://accounts.spotify.com/api/token',my_headers,body=my_body,encode='form'))


auth_header<-httr::add_headers('Authorization'=paste('Bearer',my_token$access_token))

#Have to rerun the above regularly, as the access token expires after a while 


#now we build the uri to actually retrieve data from the spotify API 

#build the endpoint 

endpoint <- "api.spotify.com"

#the reference for the extended Spotify URIs is here:
#https://developer.spotify.com/documentation/web-api/reference/albums/


#the {id} indicated on the Spotify API reference page, is an alphanumeric string. 
#That corresponds to an individual artist. You can look them up on open.spotify.com
#We'll need to figure out away to automatically retrieve them. 
#would replace "{id}" with "3TOqt5oJwL9BE2NG9MEwDa" to pull data on the band
#"Disturbed"

#The following are sample search search strings for various data points you
#can pull from the Spotify API 

# /v1/artists/{id} 	Get an Artist 	artist
# /v1/artists/{id}/albums 	Get an Artist's Albums 	albums
#	/v1/artists/{id}/top-tracks 	Get an Artist's Top Tracks 	tracks
# /v1/artists/{id}/related-artists 	Get an Artist's Related Artists 	artists
#	/v1/artists 	Get Several Artists 	artists

#build an API call to get data on an individual artist.

artist_data <- "/v1/artists/"  #easy to build with paste0, but the others get tricky 

disturbed_id <- "3TOqt5oJwL9BE2NG9MEwDa" #ID for Disturbed 

sg <- "5xUf6j4upBrXZPg6AI4MRK" #ID for Soundgarden 


#build full URI and call Spotify API to get band info 

band_info <- httr::content(httr::GET(paste0(endpoint,artist_data,
                                         disturbed_id,sep=''),auth_header))


#build URI to get top tracks, format is: #	/v1/artists/{id}/top-tracks

artist_data <- "/v1/artists/"  #easy to build with paste0, but the others get tricky 

top_tracks <- "/top-tracks"

country_data <- "?country=SE" #requires country parameter with two letter code
#using "from_token" will just pull from the country the access token was 
#generated in. 


pull_top_tracks <- httr::content(httr::GET(paste0(endpoint,artist_data,
                        sg,top_tracks,country_data,sep=''),auth_header))


#rest of the API pulls follow the same paradigm, use the format above and then 
#use paste to assemble the URI. '

#this allows you to build general search queries: 
# https://developer.spotify.com/documentation/web-api/reference/search/search/


#searching for an artist without the id follows this paradigm
#https://api.spotify.com/v1/search?q=tania*&type=artis

#sample pull 


pull_top_tracks <- httr::content(httr::GET(paste0(endpoint,spotify_search,
                        artist,search_type,search_country,sep=''),auth_header))


spotify_search <- "/v1/search?q="
artist <- "Wu+Tang+Clan"
search_type <- "&type=track"
search_country <- "&market=US"




