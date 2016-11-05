# COURSERA R Programming Assignment 03: Getting and Cleaning Data
# Author: LAM CHOON HO
# Date: NOVEMBER 2016

# Setting Up Working Directory
setwd("D:/Coursera")

# Create working directory and dowload dataset file
if(!file.exists("./assignmentData")){dir.create("./assignmentData")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./assignmentData/assignmentData.zip")

# Unzip dataset file
unzip(zipfile="./assignmentData/assignmentData.zip",exdir="./assignmentData")

# read x and y train and test data respectively
xtrainData <- read.table("./assignmentData/UCI HAR Dataset/train/X_train.txt")
ytrainData <- read.table("./assignmentData/UCI HAR Dataset/train/y_train.txt")
subjecttrainData <- read.table("./assignmentData/UCI HAR Dataset/train/subject_train.txt")

xtestData <- read.table("./assignmentData/UCI HAR Dataset/test/X_test.txt")
ytestData <- read.table("./assignmentData/UCI HAR Dataset/test/y_test.txt")
subjecttestData <- read.table("./assignmentData/UCI HAR Dataset/test/subject_test.txt")

# read features and activity data
featuresData <- read.table("./assignmentData/UCI HAR Dataset/features.txt")
activitylabelsData <- read.table("./assignmentData/UCI HAR Dataset/activity_labels.txt")

# assign column name accordingly
colnames(xtrainData) <- featuresData[,2]
colnames(ytrainData) <- "activityId"
colnames(subjecttrainData) <- "subjectId"
colnames(xtestData) <- featuresData[,2]
colnames(ytestData) <- "activityId"
colnames(subjecttestData) <- "subjectId"
colnames(activitylabelsData)  = c('activityId','activityType')

# merging tables
trainingData <- cbind(subjecttrainData,xtrainData,ytrainData) 
testData <- cbind(subjecttestData,xtestData,ytestData)
resultData <- rbind(trainingData,testData)
resultDataCol <- colnames(resultData)

mean_stdData <- (grepl("activityId" , resultDataCol) | grepl("subjectId" , resultDataCol) | grepl("mean.." , resultDataCol) | grepl("std.." , resultDataCol))

setMeanAndStd <- resultData[ , mean_stdData == TRUE]
setActivityNames <- merge(setMeanAndStd, activitylabelsData,by = 'activityId',all.x=TRUE)

TidyData <- aggregate(. ~subjectId + activityId, setActivityNames,mean)
TidyData <- TidyData[order(TidyData$subjectId, TidyData$activityId),]

write.table(TidyData, "TidyData.txt", row.name=FALSE)
write.csv(TidyData, "TidyData.csv")

