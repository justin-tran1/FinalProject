# Final Project Proposal
## Justin Tran, Markham Lee, Shlok Asrani
## 1 March 2019

### Project Description

#### Dataset

For our team project, we’ll be working on the Spotify Web API to analyze track-related, artist-related as well as user-related data which will eventually be used to present and visualize musical trends on a global scale. This data was collected by the Spotify music streaming platform that is available on the Apple App Store, Android Google Play Store as well as the Microsoft Store. Spotify uses it’s user activity to compile analytics and improve their platforms recommendation systems, and has a very wide data collection range for the same. It publishes this data for potential integrations in new apps, websites and other useful widgets on an open source level, but also has a very strong and stringent privacy policy that ensures individual user privacy. The data available for potential collaborative efforts is limited to data that doesn’t violate their promised privacy policy, and is available to all developers on their Spotify for Developers website at [https://developer.spotify.com](https://developer.spotify.com).

#### Target Audience

Our target audience for this data would broadly be anyone that is a Spotify stakeholder. Spotify stakeholders include free users, subscription-paying members, Spotify employees, shareholders, artists, distributors, music industrial analysts, music industry executives, artist-specific executives, artist managers/agents and anyone involved with the music creation process. For our project, we hope to specifically cater to artists, their executives and their production teams by providing them with country-specific data that will help them gain popularity through narrower segmentation and music adaptations based on their existing popular markets.

#### What Does Our Audience Want To Learn From Our Data?

Due to the recent emerging trend of digital analytics and business intelligence, artists and music executives are depending vastly on listener data and analytics to provide direction for music production and marketing efforts to more precisely target their primary audience. Music industry executives, analysts and officials can use our data to direct their marketing efforts and music development to target their existing audiences where they enjoy more popularity as well as use our data as a starting point to acquire more fans and hence grow to a larger audience. 

#### Potential Questions Our Data Will Answer

These are just some of the questions our data will answer -:
Q1 - “How popular is this particular track?”
Q2 - “Which countries is this track available in?”
Q3 - “Which countries enjoy my tracks, and which tracks specifically do each of the countries enjoy?”

Using the Spotify API, an artist can see which countries a specific track is available in. For example, a song might be available in Mexico but not in Germany. Another question that can be answered by our data is the popularity of a song on a scale of 0-100. An artist might be interested in which of their many songs is most popular (popular based off mostly of number of playbacks) and use that information to make future songs more popular. A third question that can be answered with the API seeing which songs are most popular in different countries. For example, the United States and Canada are neighbors, but their music tastes might vary a lot. For an aspiring artist, they might be interested in the most popular tracks for a given country in order to tune their music to that country and get more listeners.


### Technical Description

We will be using the Spotify Web API to dynamically pull in data on an individual track’s popularity, available markets and the most popular track in an individual market. Gathering certain data points may need to be an aggregate of multiple API calls, in that we will need to provide the name of an artist, hit an API to get the base-62 unique ID for each artist and then feed that into the API call to get the needed information.

#### Data Wrangling

Based on our initial experiences connecting to the API calls the data come through is a fairly easy easy to digest and use format, which in of itself, won’t require much manipulation. A lot of the data wrangling will come from needing to combine the outputs of multiple API calls. E.g. the first call provides the top five most popular tracks for a given artist, the second call tells what markets that track is available and subsequent calls provide popularity per market. These data points would have to be aggregated together in order to provide the global picture of an artist or track’s popularity. E.g. global popularity vs. popularity in Japan, UK, Finland.

#### Relevant Libraries 

We will be using the RSpotify and SpotifyR data libraries to simplify API connections for the most common pieces of information, and to remove the need to identify the unique Spotify ID for a particular artist. However, due to the fact that we will be using information outside of the functions included in each package, we will still have to build our own functions to get data that falls outside of the scope of these libraries.  

#### Technical Challenges

Quickly aggregating the data from multiple API calls into a single data frame, which is then read into a web app that is able to quickly generate a visualization. We’ll have to make sure that the app is able to make all the API calls properly, wrangle and organize the data without human intervention and then use that to create the visualization. The trick will be to make sure that the data is always acquired in a consistent format, so as to avoid errors or glitches as it’s re-organized for the visualizations/web app. We’ll also need to have appropriate messages for instances where a particular song is only available in one market, and/or other instances when the data doesn’t fit the expected format.

#### What questions, if any, will you be answering with statistical analysis/machine learning?

Prior to services like Spotify music markets tended to be regional, in that only the major crossover acts would become well known international, and would therefore be heard on the radio or available for purchase outside of their native market. Spotify “makes the world smaller”, in that it’s relatively easy for people to browse, discover and learn about music from all over the world. The question we’ll be trying to answer is whether or not Spotify users are taking full advantage of the global music access that Spotify offers, or if they’re still predominantly listening to music from their home markets.
