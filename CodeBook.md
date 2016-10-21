
# Code Book

## About the dataset
### This dataset is a subset of the Human Activity Recognition Using Smartphones Dataset (Version 1.0)

#### Authors:
___________________________________________________________
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
______________________________________________________________

### Description of variables and observations: 
#### Original dataset
The experiments were carried out with a group of 30 volunteers (or subjects) within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the authors captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained original dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For more information on the variables and observations of the original dataset is available in the README.txt file of the .zip file: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of how the data was obtained is explained here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Processing the data
#### Run_analysis.R script
This is a script that process and cleans the data performing the following tasks:

* Downloads the "UCI Human Activity Recognition Using Smartphones Data Set" zip file from the url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, unzips it and cretaes the directory "UCI HAR Dataset" in the current working directory with several .txt files described in the README.txt file of the created directory.
* Merges the original sets of data for the training set ("/train/X_train.txt") and the test set ("/test/X_test.txt")
* Extracts only the measurements on the -mean()- and standard deviation -std()- for each measurement. 
* Appends the descriptive activites with descriptive names as a factor variable to the data set 
* Appropriately labels the data set with descriptive variable names using the “feature” vector in the original dataset file
* Appends the subject label as an integer class variable to the data set
* Orders the data set by the subject label (in ascending order)
* From the extracted data set described above it creates an independent tidy data set with the average of each variable for each activity and each subject
* It writes two .csv files:
    1)  "mean_std_vars.csv" which exports the first data set wwith the mean and std measurements and the appended variables: subject and activity 
    2) "avg_data.csv" for the tidy data set with the mean values for each variable for each activity and each subject


## Requirements
 * Please choose a proper work directory before running the script. The .zip file would be downloaded in the current work directory. 
* You will need to install the "dplyr" library


## The tidydataSmartphone repo includes the following files:

- 'README.md' : A file that explains how all of the scripts work and how they are connected.

- 'CodeBook.md': A description of the cleaning and processing of the Human Activity Recognition Using Smartphones Dataset (Version 1.0) dataset

- 'run_analysis.R': R script to process and clean the dataset

