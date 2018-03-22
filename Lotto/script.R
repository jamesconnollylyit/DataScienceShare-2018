# Lotto example using datasets on Blackboard
# Data up to end of 2017
# All data files are downloaded from blackboard to c:/lotto

# Good practice to look at the nature of the data
# and what R does to it when it is loaded into a data frame

# Pick a csv file and load it into a temp data frame
temp <- read.csv("c:/lotto/1999.csv")
# Examine its structure - an attribute needs to be removed
# and Date should be converted from a factor to a Date variable
str(temp)
# Examine some data within the data frame to ensure it has
# inserted correctly
head(temp, 10)

# Create a vector of filenames containing file extension .csv
# located in c:/lotto
csv_file_list <- list.files(path = "c:/lotto", pattern = "*.csv")

# Examine the vector
csv_file_list


# Function that reads all csv files into one data frame and returns the result.
combine_results <- function(file_list) {
    # Initialise lotto_data variable
    # Note: it hasn't been assigned a specific variable type eg string 
    all_lotto_data <- NULL

    for (csv_file in file_list) {
        # Read each of the csv files in turn and skip the first line of data as it
        # contains headings within the csv file
        lotto_file <- read.csv(header = TRUE, paste("c:/lotto/", csv_file, sep = ""), stringsAsFactors = FALSE)
        # Only select attributes we're interested in
        # We don't need the first attribute
        data_of_interest <- lotto_file[1:8]
        # append vertically to the all_lotto_data data frame
        all_lotto_data <- rbind(all_lotto_data, data_of_interest)
    }
    # Return the concatenated result
    return(all_lotto_data)
}

# Call the function and return the result to a data frame
my_lotto_data <- combine_results(csv_file_list)
# show the contents of my_lotto_data
my_lotto_data

#Save the contents of my_lotto_data to a csv file called "ld.csv"
write.csv(my_lotto_data, file = "ld.csv", quote = FALSE, na = "", row.names = FALSE)