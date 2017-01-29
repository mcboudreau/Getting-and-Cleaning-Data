# Getting and Cleaning Data Project Code Book
This is the code book for the porject that will describe the variables, data and work performed to clean up the data

# Introduction
###Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Attribute Information:
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

# The Data & Variables
* subject_test, x_test, and y_test represent the data tables for the test data provided from the experiment.
* subject_train, x_train and y_train represent the data tables for the training data provided from the experiment.
* features represents the data table for the features (measured variables) from the experiment.
* activity_labels represents the data table for the activity labels used in the experiment and contains:
  + 1 WALKING
  + 2 WALKING_UPSTAIRS
  + 3 WALKING_DOWNSTAIRS
  + 4 SITTING
  + 5 STANDING
  + 6 LAYING
  
* data_test column binds all of the test data
* data_training column binds all of the training data
* data_master combines both the test and training data, sets the column names and subsets the variables to only include those measuring the mean or standard deviations
* data_tidy takes the means of the variables by Activity type as well as by Subject ID

# Data Tidying Process
In order to reduce the data to only those fields we want to see and in order to make the data more readable, here are the steps that were taken:
- All of the test data and training data were combined to give us one big table of results
- The column names were udpated to meaningful titles
  + Activity represents the Activity type
  + Subject represents the ID of the participant
  + The remaining columns represent the many calculations taken (converted to character names)
- I then extract only the calculations for means and standard deviatoins
- I then use the activity_labels table to convert the activity column to display the full name of the activity
- I summarize the data by taking the mean of each calculation sorted by both activity and subject ID
- The data is then output to a file named tidydata.txt, which holds the tidy_data table in tab delimited format.
