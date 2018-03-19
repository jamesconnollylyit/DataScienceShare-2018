# Create column names for each attribute in the data frame
colnames <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")

# Enter data into vectors before constructing the data frame
date_col <- c("2018-15-10", "2018-01-11", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99) # 99 is one of the values in the age attribute - will require recoding
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of the missing data for this attribute
q5_col <- c(5, 5, 2, NA, 1)

# Construct a data frame using the data from all vectors above
my_data <- data.frame(date_col, country_col, gender_col, age_col, q1_col, q2_col, q3_col, q4_col, q5_col)

# Add column names to data frame using colnames vector
colnames(my_data) <- colnames

# Display contents of my_data
my_data

# Show first 5 rows from my_data
head(my_data)

# Show attribute structure of my_data
str(my_data)

# Recode the incorrect 'age' data to NA
my_data$Age[my_data$Age == 99] <- NA
# Examine new data in my_data to confirm substitution
my_data

# Create a new attribute called AgeCat and set valuess
# in AgeCat to the following if true:
# <= 25 = Young
# >= 26 & <= 44 = Middle Aged
# >= 45 = Elderly
# We will also recode age 'NA' to Elder

my_data$AgeCat[my_data$Age >= 45] <- "Elder"
my_data$AgeCat[my_data$Age >= 26 & my_data$Age <= 44] <- "Middle Aged"
my_data$AgeCat[my_data$Age <= 25] <- "Young"
my_data$AgeCat[is.na(my_data$Age)] <- "Elder"

# Show contents of data frame
my_data

# Recode AgeCat so that is ordinal and factored with the
# order Young, Middle aged, Elder
# We'll srore the ordinal factored data in variable 'AgeCat'
AgeCat <- factor(my_data$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))

# Show contents of AgeCat
AgeCat

# Replace my_data's AgeCat attribute with newly ordinal foctored data
my_data$AgeCat <- AgeCat
# Show new structure
str(my_data)

# Create a new column called 'summary_col' that
# contains a summary of each row
summary_col <- my_data$Q1 + my_data$Q2 + my_data$Q3 + my_data$Q4 + my_data$Q5
summary_col

# Add summary_col to the end of the data frame
my_data <- data.frame(my_data, summary_col)
my_data

# Convert string to date fields
# Show structure of the data frame
str(my_data)

# Example of as.Date() function
strDates <- c("01/05/1965", "16/08/1975")
dates <- as.Date(strDates, "%d/%m/%Y")
dates

# Convert the date field in my_data to a date
# Original data
my_data$Date

# Convert from string to relevant structure
# In this example, convert date string to yyyy-dd-mm
# as we have to match what is in the original vector
# before we can convert it
date_field <- as.Date(my_data$Date, "%Y-%d-%m")
# Show output
date_field
# Replace the date field in the data frame
my_data$Date <- date_field
str(my_data)
my_data

# Example of changing the output date
date_format <- "%b %d %Y"
today <- Sys.Date()
output_date <- format(today, format = date_format)
output_date

# Display difference between 13th Feb 2004 and 22nd Jan 2018
startdate <- as.Date("2004-02-13")
enddate <- as.Date("2018-01-22")
days <- enddate - startdate
days

? difftime
# Calaulate you old I am in days
todays_date <- Sys.Date()
my_dob <- as.Date("08-03-1977")
diff_dates <- difftime(today, my_dob, units = "days")
diff_dates

#Sorting data by age
my_data
new_data <- my_data[order(my_data$Age),]
new_data

# We can use attach command to bypass need for '$' sign 
# to identify variables in the data frame
attach(my_data)
str(my_data$Age)
str(my_data$Gender)
new_data <- my_data[order(Gender, Age),]

# Sort by AgeCat. This is a factored variable
new_data <- my_data[order(AgeCat),]
new_data

