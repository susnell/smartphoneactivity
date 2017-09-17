##Summarizing Data on Human Activity Recognition on Smartphones

This script summarizes average data from a larger data set of human activity recognition on smartphones. The data set comes from an experiment of 30 people, who each performed 6 activities wearing a smartphone on their waist. Test subjects' movement was measured using the smartphones' accelerometer and gyroscope. This script produces a table of averages (by activity and by test subject) of the means and standard deviations of the variables measured in the experiment.

The data from the test subjects was randomly split into training and test datasets. This script joins the training and test datasets together. Averages are from the total data. 

The script is part of the course project for Coursera Data Science 3 Getting and Cleaning Data.

The script performs the following tasks:
### 0.1 Loading packages required for the running of the script
### 0.2 Downloading and unzipping the data, if the unzipped folder does not exist in the working directory
### 0.3 Reading and precleaning the variable names to make them unique
(The feature names in the original features.txt-file are not unique.)
### 0.4 Reading the training data, and combining to it from separate files
* the variable names (features), 
* the test subject id data and 
* the activity id data
Identical procedure is performed then for the test data
### 0.5 Reading the test data and combining to it 
* the same variable names as to the training data, 
* the test subject id data and 
* the activity performed id data
### 1 Merging the training and the test sets to create one data set
The datasets have been kept identical in width an column names, so this operation is performed by just adding one data set to the end of the other by rbind()
### 2 Extracting only the measurements on the mean and standard deviation for each measurement
All the variables that have "mean" or "std" in their name are selected. 
This gives 86 measurements for further analysis. 
### 3 Providing descriptive activity names for the activities in the data set
A small dataset containing the activity ids and names is merged to the large dataset based on activity id. The activity id number is then removed to keep the data more simple.
### 4 Labeling the data set with descriptive variable names
The label names are cleaned of parentheses and dashes, but retain all the information from the original feature names in the dataset.
### 5 Creating a second data set with the average of each variable for each activity and each subject
The data is grouped first by activity and then by subject. The result is a table of averages of 86 variables. The variables still have their close to original names, but the results are the means of means and standard deviations.


The source of the original data set and experiment is:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


