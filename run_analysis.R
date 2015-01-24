# Getting and Cleaning Data Course Project
library(data.table)

# Load feature names and clean them up
features <- read.table("./features.txt",stringsAsFactors=FALSE)
features <- features[,2]
features <- gsub("[()]","",features)
features <- gsub("[-]","_",features)
features <- gsub("^t","Time",features)
features <- gsub("^f","Frequency",features)
features <- gsub("BodyBody","Body",features)
features <- gsub("anglet","AngleTime",features)
features <- c("Subject","Activity",features)

# Load and merge the test data together into one data table
if(!exists("subject_test"))
{
  subject_test_f <- read.table("./test/subject_test.txt")
  subject_test <- as.data.table(subject_test_f)
}
if(!exists("X_test"))
{
  X_test_f <- read.table("./test/X_test.txt")
  X_test <- as.data.table(X_test_f)
}
if(!exists("y_test"))
{
  y_test_f <- read.table("./test/y_test.txt")
  y_test <- as.data.table(y_test_f)
}
test_data <- cbind(subject_test,y_test,X_test)
setnames(test_data,features)

# Load and merge the training data together into one data table
if(!exists("subject_train"))
{
  subject_train_f <- read.table("./train/subject_train.txt")
  subject_train <- as.data.table(subject_train_f)
}
if(!exists("X_train"))
{
  X_train_f <- read.table("./train/X_train.txt")
  X_train <- as.data.table(X_train_f)
}
if(!exists("y_train"))
{
  y_train_f <- read.table("./train/y_train.txt")
  y_train <- as.data.table(y_train_f)
}
train_data <- cbind(subject_train,y_train,X_train)
setnames(train_data,features)

# Now row-bind the test and training data together to create the 
# total dataset
total_data <- rbind(test_data, train_data)

# Create factors out of the activity information
activities <- read.table("./activity_labels.txt")

# Change activity data from numeric to strings
total_data$Activity <- activities[total_data$Activity,2]

# Construct the data table with only subject, activity, and variables 
# related to mean and std
final_data <- select(total_data,contains("Subject"))
final_data <- cbind(final_data,select(total_data,contains("Activity")))
final_data <- cbind(final_data,select(total_data,contains("mean",ignore.case=TRUE)))
final_data <- cbind(final_data,select(total_data,contains("std",ignore.case=TRUE)))