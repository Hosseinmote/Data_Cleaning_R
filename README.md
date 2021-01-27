# Getting and Cleaning Data via R

The purpose of this project is to to collect, work with, and clean a data set.
The data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

This project contains the following files and folders:

* Codebook.Rmd: The R markdown file containing the R code and description about the project and data cleaning 
* run_analysis.R : The R commands to generate clean and tidy data from the dataset
* UCI_HAR_DataSet/: The dataset folder.
* tidydata_mean.txt: The genereated tidy data 

The procedure to create the tidydata_mean.text:

1) Merge the training and the test sets to create one data set.
2) Extract only the measurements on the mean and standard deviation for each measurement. 
3) Use descriptive activity names to name the activities in the data set
4) Appropriately label the data set with descriptive variable names. 
5) From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

For detailed description about the project and data, please check out the Codebook.Rmd and the dataset folder