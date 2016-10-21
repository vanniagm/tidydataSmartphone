# README


 This is a Coursera program assignment for the Getting and Cleaning Data Course (week 4). 
 This project consists in cleaning, processing and analysing the "Human Activity Recognition Using Smartphones Dataset (Version 1.0)" downloaded from here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## The tidydataSmartphone repo includes the following files:

- 'README.md' : A file that explains how all of the scripts work and how they are connected.

- 'CodeBook.md': A description of the cleaning and processing of the Human Activity Recognition Using Smartphones Dataset (Version 1.0) dataset. Please read this file before running the "run_analysis.R" script.

- 'run_analysis.R': R script to process and clean the dataset

## How it works

1)  Please choose a proper work directory before running the script. The .zip file would be downloaded in the current work directory. 
2)  You will need to install the "dplyr" library
3) Run the "run_analysis.R" script in R 
 ```
  source("run_analysis.R")
 ````
4) It will create two .csv files in the working directory with a clean and processed dataset "mean_std_vars.csv" and a tidy dataset of the former, "avg_data.csv". Please read the CodeBook file for further description.

