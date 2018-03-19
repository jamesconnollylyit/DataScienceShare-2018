# Load data from previous session
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

# Recode the incorrect 'age' data to NA
my_data$Age[my_data$Age == 99] <- NA

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

# Recode AgeCat so that is ordinal and factored with the
# order Young, Middle aged, Elder
# We'll srore the ordinal factored data in variable 'AgeCat'
AgeCat <- factor(my_data$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))

# Replace my_data's AgeCat attribute with newly ordinal foctored data
my_data$AgeCat <- AgeCat

# Create a new column called 'summary_col' that
# contains a summary of each row
summary_col <- my_data$Q1 + my_data$Q2 + my_data$Q3 + my_data$Q4 + my_data$Q5
summary_col

# Add summary_col to the end of the data frame
my_data <- data.frame(my_data, summary_col)

# Show data frame contents
my_data

# -------------------------------------------------------------------------------
# Dealing with missing data 
# -------------------------------------------------------------------------------

# Use complete.cases to show rows where data is missing
missing_data <- complete.cases(my_data)
missing_data

# list the rows that do not have missing values
# Note that the ',' and no number inside square brackets means "all columns"
my_data[complete.cases(my_data),]

# List rows with missing values
my_data[!complete.cases(my_data),]

# Find sum of all missing values in the age attribute
sum(is.na(my_data$Age))

# Find the mean of missign values from the Age attribute
mean(is.na(my_data$Age))

# Find the mean of rows with no incomplete data
# Note that we dont need to add the ',' as we're only
# looking for an overall mean of rows with missing values
mean(!complete.cases(my_data))
