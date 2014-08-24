Getting and Cleaning Data Anlysis Course Project
===========================

This repository contains the data that can originaly be found here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of the original data can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

High level description of the data:
One of the most exciting areas in all of data science right now is wearable computing - see for example  this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

Run_Analysis.R
===========================
run_analysis.R is a script that manipulates the train/test data by merging the datasets, giving meaningful labels along with merging the data about the subjects and the activities the subjects are performing into a single file. The script writes a couple of files while also outputting a table as the final output.

Files outputted: 
* experiment_data.txt: experiment_data is the merge of training/test sets. It also merges the subject data to include the subject and activitiy columns in the file. Finally, this file extracts out only the variables in which the mean or std was calculated on the signals. This does not include meanFrequency and/or the derivate variables.
* activity_experiment_mean.txt: file contains the column mean of the data in experiment_data.txt
* Final output: final output is the same table that is written to activity_experiment_mean.txt

More details on how the data was processed is as follows;
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


