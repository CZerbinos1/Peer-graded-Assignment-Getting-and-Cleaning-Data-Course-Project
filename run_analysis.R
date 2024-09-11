## Preparation Stage
# Loading required packages
library(dplyr)

# Download the dataset
filename <- "Coursera_DS3_Final.zip"

# Checking file
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method = "curl")
}  

# Checking folder 
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Data frame assignment
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

## run_analysis.R
# Merge the training and test sets 
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

# Deviation Measurement
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

# Activities description
TidyData$code <- activities[TidyData$code, 2]

# Adjust column names to match the desired format
names(TidyData)[2] <- "activity"
names(TidyData) <- tolower(names(TidyData))  # Convert to lowercase
names(TidyData) <- gsub("acc", "accelerometer", names(TidyData))
names(TidyData) <- gsub("gyro", "gyroscope", names(TidyData))
names(TidyData) <- gsub("bodybody", "body", names(TidyData))
names(TidyData) <- gsub("mag", "magnitude", names(TidyData))
names(TidyData) <- gsub("^t", "time", names(TidyData))
names(TidyData) <- gsub("^f", "frequency", names(TidyData))

# Replace -mean() and -std() with proper format
names(TidyData) <- gsub("-mean\\(\\)", ".mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-std\\(\\)", ".std", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-freq\\(\\)", ".freq", names(TidyData), ignore.case = TRUE)

# Adjust angle and gravity occurrences
names(TidyData) <- gsub("angle", "angle.", names(TidyData))
names(TidyData) <- gsub("gravity", "gravity.", names(TidyData))

# Remove parentheses, dashes, and correct dots
names(TidyData) <- gsub("\\(\\)", "", names(TidyData))  # Remove any parentheses
names(TidyData) <- gsub("-", ".", names(TidyData))  # Replace dashes with dots

# Enhanced cleanup to remove double dots
names(TidyData) <- gsub("\\.\\.", ".", names(TidyData))  # Replace double dots with single dot
names(TidyData) <- gsub("\\.$", "", names(TidyData))  # Remove any trailing dots

# Final column names check
print(names(TidyData))  # Check column names to ensure they look clean

# Calculate variable averages for each subject and activity
FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = 'drop')

# Disable scientific notation for cleaner output
options(scipen = 999)

# Write the FinalData to a clean text file with tab-separated values
write.table(FinalData, "FinalData.txt", sep = "\t", row.names = FALSE, quote = FALSE)

# Verify that the file has been written correctly by checking the structure of the file
# Optional: print FinalData to console for a quick check
print(FinalData)