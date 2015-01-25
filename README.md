# GetAndCleanCourseProject
This repo is for the course project for the Coursera "Getting and Cleaning Data" course.

## run_analysis.R
run_analysis.R is the only script in this project.  Its purpose is to load and clean [this  
data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Script dependencies
Before running the script, ensure that the following packages are installed:
* data.table
* tidyr
* dplyr

## Executing run_analysis.R
To run this script, ensure that the aforementioned data is in the R working directory, 
along with run_analysis.

## Steps followed
###Cleaning variable names
* To make the variables easier to work with in R, the following characters were removed 
as they were loaded from features.txt: (, ), -.

* The "t" and "f" prefixes found on many feature names were transformed to "Time" and 
"Frequency," respectively.

* Some features contained the phrase "BodyBody;" this was shortened to "Body."

* The "anglet" prefix was modified to "AngleTime."

This resulted in 565 variables, including "Subject" and "Activity."

###Assembling the data
Data from the original study is partitioned into two distinct sets: train and test.  Both 
of these datasets were labeled in identical fashion, according to the cleaned variable 
names mentioned above.  To construct the complete dataset, the test and train datasets 
are row-bound together in that order.

Next, activities performed by the subject are given their actual names, instead of their 
integer-equivalent values to ensure that the data table is more readable.

Before the final analysis can be performed, we must strip out all variables except 
"Subject," "Activity," and all measurements of means and measurements of standard 
deviations.

The final tidy dataset produced by run_analysis.R groups the data by Activity and Subject.  
From this grouping, we calculate the mean value of each variable left in the dataset.

## Output
The final output of run_analysis.R is a csv text file containing a tidy dataset for each 
subject and activity in the study.  All variables not labeled "Activity" and "Subject" 
are averages of the original data measured in the study.  For more information on the 
original data, consult the documentation included with that data.

To view the final tidy dataset, execute run_analysis.R and read the result as 
result <- read.csv("./tidy_data.txt")