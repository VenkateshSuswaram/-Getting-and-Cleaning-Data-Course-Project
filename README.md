# Getting and Cleaning Data Course Project

## This README seeks to accomplish two goals:

* explain how the run_analysis.R script works.
* facilitate evaluation of the Course Project.

## The run_analysis.R script aims to accomplish the following goals:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### Please see the run_analysis.R script for a detailed description of the implementation of each step used to accomplish the goals. Here is a high level description of the steps in the script used to accomplish each goal.

### To accomplish goal 1, the run_analysis.R script performs the following steps:

Before running the script copy the folder "UCI HAR Dataset" in R working directory.
The script Reads in the X_test.txt X_train.txt and appends the data in to to data set X. Similarly the data set for Y & subject are comined to form a final data set.

### To accomplish goal 2, the run_analysis.R script performs the following steps:

* Reads the feature labels from features.txt.
* Filter the feature labels to only those containing 'mean' or 'std' in the name (excluding those containing 'angle', which are angle measurements, not means or standard deviations.
* Create the corresponding column names (e.g. "V1", "V2") for the filtered feature names
* Select the columns from the data set that match the selected features.

### To accomplish goal 3, the run_analysis.R script performs the following steps:

* Read in the activity labels and corresponding numeric codes from activity_labels.txt.
* Transform the numeric activity column into a factor column using the numbers and labels read in from activity_labels.txt

### To accomplish goal 4, the run_analysis.R script performs the following steps:

Use the setnames function of the data.tables library to change the column names of each "V1", "V2", etc., column to the corresponding label previously read in from features.txt.

Data is saved in the name "tidyData.txt"

### To accomplish goal 5, the run_analysis.R script performs the following steps:

* melt the data using the "subject" and "activity" columns as ids and all the descriptive column names from goal 4 as the measure variables.
* Use dcast to cast the melted data frame, summarizing each measure variable by the measurements in each subject and activity group.

Data is saved in the name "tidyData2.txt" Contents can be viewed from the command  ** View(head(tidyData2),30) **

### END
