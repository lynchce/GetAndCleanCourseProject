# GetAndCleanCourseProject
This repo is for the course project for the Coursera "Getting and Cleaning Data" course.

# run_analysis.R
run_analysis.R is the only script in this project.  Its purpose is to load and clean the 
data found at the link 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Script dependencies
Before running the script, ensure that the following packages are installed:
* data.table
* tidyr
* dplyr

# Executing run_analysis.R
To run this script, ensure that the aforementioned data is in the R working directory, 
along with run_analysis.

# Output
The final output of run_analysis.R is a csv text file containing a tidy dataset for each 
subject and activity in the study.  All variables not labeled "Activity" and "Subject" 
are averages of the original data measured in the study.  For more information on the 
original data, consult the documentation included with that data.

To view the final tidy dataset, execute run_analysis.R and read the result as 
result <- read.csv("./tidy_data.txt")