library(dplyr)
library(lintr)
library(styler)



# a short R file to edit down the .csv files so that the four countries and the
# global data all cover the same time frame: 9-29-2017 - 12-29-2018. The
# reason for doing this was due to discovering that Japan's data only went back
# to 9-29-17 after data for other countries had already been downloaded.


# editing down global

# read in global data

global_data <- read.csv("global_averages.csv", stringsAsFactors = FALSE)

# view data to determine which columns to get rid of
View(global_data)

# visual inpections reveals that we have to get rid of rows 13 through 20 and the
# data is out of order. Solution: just regenerate from scratch.


# read in Brazil data
brazil <- read.csv("data_averages/updated_files/global_averages(revised).csv", stringsAsFactors = FALSE)

# View data to verify it's the right number of data points, both in number and
# the right dates.
View(brazil)

# data frame has an excess column


# Delete excess column,
brazil_edited <- brazil[, -c(1)]

# verify updated data frame
View(brazil_edited)


# write the updated file to a .csv
write.csv(brazil_edited, "data_averages/updated_files/brazil_averages(revised).csv",
  row.names = FALSE
)

# read in data for the USA
america <- read.csv("data_averages/America_data.csv", stringsAsFactors = FALSE)

# verify that the data is correct
View(america)

# Visual inspection reveals that the data has an erroneous column, is missing
# multiple rows and the data appears to be in reverse order. Solution: use the
# process_spotify_charts.R file to regenerate the file, as there are too many
# potential errors.


# read in data for Japan
japan <- read.csv("data_averages/updated_files/japan_averages(revised).csv", stringsAsFactors = FALSE)

# verify that the data is correct
View(japan)

# Visual inspection reveals that there is an erroneous column, edit the
# dataframe accordingly.


# Excess row column exists, delete and then resave the .csv file
japan_edited <- japan[, -c(1)]

# verify file is correct
View(japan_edited)

# write the updated file to a .csv
write.csv(japan_edited, "data_averages/updated_files/japan_averages(revised).csv",
  row.names = FALSE
)



# read in data for UK
uk <- read.csv("data_averages/GreatBritain_data.csv", stringsAsFactors = FALSE)

# verify that the data is correct
View(uk)

# Visual inspection reveals that there is an erroneous column, and it's missing
# a row (12/28/17) delete the column and use the process_spotify_charts.R
# file to insert the proper column.

# Excess row column exists, delete and then resave the .csv file
uk_edited <- uk[, -c(1)]

# verify data frame is correct
View(uk_edited)

# write edited data frame to a .csv file.
write.csv(uk_edited, "data_averages/updated_files/uk_averages(revised).csv",
  row.names = FALSE
)
