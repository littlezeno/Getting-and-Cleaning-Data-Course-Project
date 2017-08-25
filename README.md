# Getting-and-Cleaning-Data-Course-Project
## Background
Submission for Getting and Cleaning Data Course Project fo fulfill the requirement below

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Explaination of Analyses file
List of submission files

1. The submitted data set is tidy.--mean_std_by_activity_subject.csv
2. The Github repo contains the required scripts---Wearable.R
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
-- aggregated_features_info.md, aggregated_features.csv
4. The README that explains the analysis files is clear and understandable.--README.md


### File structure of output data. "mean_std_by_activity_subject.csv"
First 2 columns identify under which experiment conditions (activities) the data are collected
The third columns identify from which participants the data are collected
From the 4th column, all data represent an average value for the measure identified in the column names by each participants and each activity. That is, each row of data are average obervations for a participants under one experiment condition. 
Only mean and standard deviation related measures from the original data source were summarized in the final data set.

## The codebook listed all variables that in final data set

* 79 features that include mean and standard deviation measures were extracted from original database
* They are then averaged by each participant and each activity. 
* There are 30 participants and 6 acitivities
* Therefore, the aggreated data set include 180 oberservations. And each observation is the average value fo mean & standard deviation measures from the original data set.

## The R code wearables
Listed code based on corresponding steps, including: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


