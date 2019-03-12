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
library(stringr)
library(DataCombine)



source("api-keys.R")

#Run the following lines of code to generate the token. client_id and 
#client_secret are stored in the api-keys file. There is probably a simpler
#way to build the token, but for now, I know the code below works. 


id_secret<-RCurl::base64(paste(client_id, client_secret,sep=':'))


my_headers<-httr::add_headers(c(Authorization=paste('Basic',id_secret,sep=' ')))


my_body<-list(grant_type='client_credentials')

my_token<-httr::content(httr::POST('https://accounts.spotify.com/api/token',my_headers,body=my_body,encode='form'))


auth_header<-httr::add_headers('Authorization'=paste('Bearer',my_token$access_token))




#Read in top 200 data .csv file 


read_data <- function(filename, filedate)     {

#convert date into date string for easier plotting   

  data_date <- as.Date(filedate)

#read in data  

global_chart <- read.csv(filename,
                         header = TRUE,
                         stringsAsFactors = FALSE)


#Fix the rows as the data often has erroneous rows 

global_chart_edited <- global_chart[-c(1),]


names(global_chart_edited) <- c("Position", "Track", "Artist", "Streams", 
                                "track_uri")

#subset a portion of the data frames rows, grabbing the top 25 tracks

chart_subset <- global_chart_edited[1:25,]



#extract the "track_uri" column as a vector to remove the leading URL part of 
#the data, and just keep the Spotify unique track ID. 

extract_uri <- chart_subset$track_uri


#Edit the track_uri column to remove the lead URL and just keep the track ID 

chart_subset_edited <- extract_uri %>%
  str_replace("https://open.spotify.com/track/", "")

#re-insert the vector back into the original chart data frame 

updated_chart <- chart_subset %>% 
  select(-track_uri) %>% 
  mutate(id = chart_subset_edited)



#Connect to the Spotify API to get a data frame with track data for each track 


track_data <- get_track_audio_features(updated_chart$id)

  

#merge data frames 

track_data_complete <- left_join(updated_chart, 
                                  track_data, by = ("id" = "id" ))


#write the processed data to a .csv file 


write.csv(track_data_complete, paste0("processed_data/",
                                      filedate, "_", "global_data", ".csv"), 
                                      row.names = FALSE)



#Calculate averages 

avg_danceability <- mean(track_data$danceability)
avg_energy <- mean(track_data$energy)
avg_loudness <- mean(track_data$loudness)
avg_speechiness <- mean(track_data$speechiness)
avg_acousticness <- mean(track_data$acousticness)
avg_instrumentalness <- mean(track_data$instrumentalness)
avg_liveness <- mean(track_data$liveness)
avg_valence <- mean(track_data$valence)
avg_tempo <- mean(track_data$tempo)

#put averages into a vector 



averages <- c(filedate, avg_danceability, avg_energy, avg_loudness, avg_speechiness,
                  avg_acousticness, avg_instrumentalness, avg_liveness,
                  avg_valence, avg_tempo)



return(averages)

}

#for this function the user passes the file path and the file date they want
#to use for the average of each musical element. E.g. Valence and Energy 

track_features <- read_data("spotify_charts/regional-global-weekly-2017-12-22--2017-12-29.csv",
                            "2017-12-29")





#create emoty data frame to store average values - 
#code inspired by: 
#https://stackoverflow.com/questions/32712301/create-empty-data-frame-with-column-names-by-assigning-a-string-vector

historical_track_data <- setNames(data.frame(matrix(ncol = 10, nrow = 0)), 
                                  c("date", "avg_danceability", "avg_energy", "avg_loudness",
                                    "avg_speechiness", "avg_acousticness", 
                                    "avg_instrumentalnes", "avg_liveness", "avg_valence",
                                    "avg_tempo"))



#insert averages data into data frame that aggregates data - use this to insert the 
#first row, use function for the others 

historical_track_data <- InsertRow(historical_track_data, track_features, RowNum = 1)

#delete the extra row the above creates 

historical_track_data <- historical_track_data[-c(4), ]


#use this function after the first row insert 


historical_track_data <- InsertRow(historical_track_data, track_features, RowNum = NULL)



#once the files are processed, write the final data frame to a .csv file 

