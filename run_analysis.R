## Summarizing Data on Human Activity Recognition on Smartphones
### Loading packages required for the running of the script
library(dplyr)
library(readr)
library(reshape2)
library(tidyr)
### Downloading and unzipping the data, if the unzipped folder does not exist
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./UCI HAR Dataset"))
  {download.file(fileurl,destfile = "./smartphoneactivity.zip",method = "curl")
  unzip("./smartphoneactivity.zip")}
### Reading and precleaning the variable names to make them unique
features0<-read.table("./UCI HAR Dataset/features.txt")
features<-as.character(features0$V2)
features<-make.unique(features,sep = "_")
features<-gsub("\\()","",features)
features<-as.factor(features)
features
### Reading the training data
trainingdata0<-read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(trainingdata0)<-features
trainnames<-read.table("./UCI HAR Dataset/train/y_train.txt") #activitynumbers
colnames(trainnames)<-"activityid"
trainnames$activityid<-as.factor(trainnames$activityid)
trainsubjects<-read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(trainsubjects)<-"subject"
trainingdata<-cbind(trainsubjects,trainnames,trainingdata0) #combining subject ids and activitynumbers to data
tbl_df(trainingdata)
### Reading the testdata
testdata0<-read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(testdata0)<-features
testnames<-read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(testnames)<-"activityid"
testnames$activityid<-as.factor(testnames$activityid)
testsubjects<-read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(testsubjects)<-"subject"
testdata<-cbind(testsubjects,testnames,testdata0) #combining subject ids and activitynumbers to data
tbl_df(testdata)
### 1. Merging the training and the test sets to create one data set
alldata<-rbind(trainingdata,testdata) #structure of the two datasets is identical, so the rows can just be added
tbl_df(alldata)
### 2. Extracting only the measurements on the mean and standard deviation for each measurement
meanstddata<-select(alldata,matches("subject|activity|mean|std"))
tbl_df(meanstddata)
### 3.Descriptive activity names for the activities in the data set
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activities)<-c("activityid","activity")
activities$activity<-sub("WALKING_","",activities$activity)
activities$activity<-tolower(activities$activity)
activities
meanstddata<-merge(activities,meanstddata,key=activityid) #Joining activity names from activity label file
meanstddata<-select(meanstddata,-activityid)
meanstddata
### 4. Labeling the data set with descriptive variable names
colnames(meanstddata)<-sub("-mean","Mean",colnames(meanstddata))
colnames(meanstddata)<-sub("-std","Std",colnames(meanstddata))
colnames(meanstddata)<-gsub("-","",colnames(meanstddata))
colnames(meanstddata)
### 5. Creating a second data set with the average of each variable for each activity and each subject
byactivitybysubject<-group_by(meanstddata,activity,subject)
averagebyactivitybysubject<-summarise_all(byactivitybysubject,mean)
write.table(averagebyactivitybysubject, file = "./tidydataset.txt", row.names = FALSE)
View(averagebyactivitybysubject)

