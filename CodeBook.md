## R Script

Below are the steps of the R script

1. Reading training & testing table, feature vector and activity labels
2. Assigning correct column names accordingly
3. Merging all data into one data set
4. Extracting value of mean and standard deviation for each measurement
5. Readinh column names and create vector for ID, mean and standard deviation
6. Making subset
7. Naming activities with desciptive activity names
8. Labeling data set with desciptive variable names
9. Create tidy data set as result
10. Making and writing tidy data set in txt and store to working directory

## Variables

Variable name       | Description
--------------------|------------
`xtrainData`        | Downloaded Data
`ytrainData`        | Downloaded Data
`subjecttrainData`  | Downloaded Data
`xtestData`         | Downloaded Data
`ytestData`         | Downloaded Data
`subjecttestData`   | Downloaded Data
`featuresData`      | Downloaded Data
`activitylabelsData`| Downloaded Data
`trainingData`      | Merging All Train Data
`testData`          | Merging All Test Data
`resultData`        | Merging All Train Data and Test Data
`resultDataCol`     | New table for resultData
`mean_stdData`      | Vector from resultDataCol
`setMeanAndStd`     | Sorted mean and standard deviation data
`setActivityNames`  | Merging setMeanAndStd and activity list
`TidyData`          | Result