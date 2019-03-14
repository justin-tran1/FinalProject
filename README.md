# Final Project Proposal
## Justin Tran, Markham Lee, Shlok Asrani
## 1 March 2019

### Project Description

#### Dataset

For our team project, we’ll be using the Spotify Web API to gather data on the "musical features" of the songs on the global Spotify Top 25 chart,as well as the top 25 charts in America, Brazil, Japan and The United 
Kingdom. The goal is to determine if there is any significant difference
between the 25 most popular songs in each country, as well as those
countries compared to each other. We're going to gather the data by 
downloading the datasets containing the top 25 songs from the Spotify
web site, and then we'll send those songs through the Spotify web API to
gather data on the musical features. Given that Spotify is arguably the world's foremost music streaming service, Spotify can be a great way to tap the pulse of musical tastes around the globe. The musical features we're going to track are: Energy, Loudness, Speechiness, Acousticness, Instrumentalness, Valence and Tempo.

Spotify collects data on each of these musical features for the purposes of recommending additional music to customers, and linking relatd artists together. Spotify also tracks information related to popularity, user taste trends, popularity charts and the like to improve their service, help advertisers target customers and provide critical information that artists can use to fine tune their offerings on the service. 


Spotify makes this data available to aid app developers who are building new apps or improving existing ones, in addition to potential integrations in websites and other useful widgets. Despite making such a large amount of data available, Spotify also has  strong and stringent privacy policy that ensures individual user privacy. The data available for potential collaborative efforts is limited to data that doesn’t violate their privacy policy or share a user's personal information, if the user hasn't authorized their data to be shared with a particular group or app. More information is available on the Spotify for Developers website at [https://developer.spotify.com](https://developer.spotify.com).

#### Target Audience

Our target audience for this data would broadly be anyone that is a Spotify stakeholder. Spotify stakeholders include free users, subscription-paying members, Spotify employees, shareholders, artists, distributors, music industrial analysts, music industry executives, artist-specific executives, artist managers/agents and anyone involved with the music creation process. The data would also be useful for people who are studying musical tastes across cultures, or anyone who wants to study how a society's moods affects their musical listening habits. 

#### What Does Our Audience Want To Learn From Our Data?

By identifying the typical musical features preferred by certain musical markets, artists and music executives can identify what types of music, or songs would be most popular in a given market. For example: the Brazilian market leans significantly higher on the valence metric (a measure of positive emptions elicited by a song) than the US market. So musicians targetting the Brazilian market should focus on their more up beat songs, while their more morose songs would probably do better in the American market. 

Due to the recent emerging trend of digital analytics and business intelligence, artists and music executives are depending vastly on listener data and analytics to provide direction for music production and marketing efforts to more precisely target their primary audience. Music industry executives, analysts and officials can use our data to direct their marketing efforts and music development to target their existing audiences where they enjoy more popularity as well as use our data as a starting point to acquire more fans and hence grow to a larger audience. 

#### Potential Questions Our Data Will Answer

These are just some of the questions our data will answer -:
##### Q1 - “Are there are major difference in musical features between countries?"
##### Q2 - “What countries are listening to the happiest music, what countries are listening to the saddest?"
##### Q3 - “Do musical elements in the top 25 charts change significantly throughout the year in a given market, or do they remain fairly similar month in and month out?"

Using the Spotify API, an artist can not only see song popularity between countries, but they can also see what musical elements certain countries prefer. This will help them guage both domestic and international songs, and help them identify the "formula" to crafting a hit in various markets. 


### Technical Description

We will be using the Spotify Web API to systematically pull in data on musical features for the top 25 songs in each market over the course of roughly 16 months. This will require both downloading the appropriate top 200 songs .csv files for the last week of the month for the period spanning 9/2017 through 12/2018 from the Spotify web site, followed by using one or more API calls to gather musical feature data for the songs in the .csv file, and then merging the data from the original .csv file and the Spotify API call into a singular data frame, which will then be saved to a new .csv file that will be read into the Shiny App. Finally, average measures for each month will be caulcated, and another data frame created with the average of each measure for the given month. These dataframes containing the average for the 16 month period will be used to generate a variety of visualizations. This process will be repeated for the Spotify global chart, as well as the charts for America, Brazil, Japan and The United Kingdom. 

The Shiny App produced by our analysis will contain the following:
* A page that summarizes the project 
* An app that allows a user to input a song and get a valence distribution showing the positive or negative emotions elicited by their favorite artist. 
* An app that looks at the trends in various musical elements over the 16 month period containing September 2017 through December 2018. 
* Density plots showing the distribution of the values of danceability, valence, etc. for each of the analyzed regions. 

#### Data Wrangling

Based on our initial experiences connecting to the API calls the data come through is a fairly easy easy to digest and use format, which in of itself, won’t require much manipulation. Based on our initial assessment, we'll have to remove a couple of erroneous rows and then edit the data in the "track_uri" column, so the data is in a format that the Spotify API can understand. Beyond that, the remaining data wrangling will come from needing to combine the outputs of both API calls and downloaded data sets. Most of this will be accomplished by a function that will read in the data from the .csv file, preform the needed data wrangling, connect to the Spotify API, gather the data on musical features, calculate the averages and then generate a vector that can be inserted into a dataframe and then loaded into a shiny app for visualizations. 

#### Relevant Libraries 

We will be using the spotifyr data libraries to simplify API connections for the most common pieces of information, as well as direct connections to the Spotify API to gather data for each of the songs in the top 25 list. We will also be using dplyr for data wrangling, shiny for the interactive visualizations, ggjoy, ggplot2 and plotly for visualizations. Other libraries such as stringr, DataCombine, rlang and httr will be used either to aid in connecting to the APIs or making certain aspects of data wrangling simpler. 
  

#### Technical Challenges

Quickly aggregating the data from multiple API calls into a single data frame, which is then read into a web app that is able to quickly generate a visualization. We’ll have to make sure that the app is able to make all the API calls properly, wrangle and organize the data without human intervention and then use that to create the visualization. The trick will be to make sure that the data is always acquired in a consistent format, so as to avoid errors or glitches as it’s re-organized for the visualizations/web app. We’ll also need to have appropriate messages for user error, or scenarios where the artist isn't on Spotify. The Spotify API is also notoriously difficult to work with, and due to the volume of API calls we're going to making during the development and fine tuning phase, we do face of risk of having our access shut off for a short period of time. 



#### What questions, if any, will you be answering with statistical analysis/machine learning?

Prior to services like Spotify music markets tended to be regional, in that only the major crossover acts would become well known international, and would therefore be heard on the radio or available for purchase outside of their native market. Spotify “makes the world smaller”, in that it’s relatively easy for people to browse, discover and learn about music from all over the world. Via the use of density plots, we're going to be able to determine if people's tastes with respect to musical features are converging, as well as whether or not the dominance of music from the United States on the charts, means that the distributions of features like valence and danceability in the United States is close to the same distributions for global charts. 


#### Notes on R scripts used to create this project 

* process_spotify_chart.R this script was used to import the downloaded .csv files, edit the column that contained the unique ID for each song, perform data wrangling and connect to the Spotify API, aggregate the averages and then create the data frame containing 16 months of data that would be used to generate the visualizations in the Shiny App. In short it's the app that processed the data in a manner that made our visualizations possible, by reading in data, connecting to APIs and then generating new .csvs that could be read into the Shiny app. 

* data_wrangling.R, this script was used to validate that the data frames with the 16 month range of data was correct, and to fix any errors contained within them. In the script each of the .csv files for data for the Global, American, Brazilian, British and Japanese charts were reviewed, analyzed, validated and fixed as needed. 

* ui.R and server.R are the files that build and run the shiny app, and display the visualizations. 
 
* Files in the Github repository beyond the above were used to prototype API connections, plots and the shiny app. 


[Link To Shiny App](https://dataspiner.shinyapps.io/FinalProject/)
