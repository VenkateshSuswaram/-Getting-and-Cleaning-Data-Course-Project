## Install Packages if not already loaded. If loaded ignore the below 4 commands.

install.packages("dplyr")
library(dplyr)

install.packages("reshape2")
library(reshape2)


# Download and extract the raw data and copy to working directory. Once copied in to working directory
## COmbine Text and Control data for X

testData <- read.table("test/X_test.txt")
trainData <- read.table("train/X_train.txt")
X <- rbind(testData, trainData)

## Remove temp tables

rm(testData)
rm(trainData)

## COmbine Text and Control data for Subject

testSub <- read.table("test/subject_test.txt")
trainSub <- read.table("train/subject_train.txt")
S <- rbind(testSub, trainSub)

## Remove temp tables

rm(testSub)
rm(trainSub)


## Read data labels for columns

testLabel <- read.table("test/y_test.txt")
trainLabel <- read.table("train/y_train.txt")
Y <- rbind(testLabel, trainLabel)

## Remove temp tables

rm(testLabel)
rm(trainLabel)

## Read Features List (to be used as column names for data)
featuresList <- read.table("features.txt", stringsAsFactors=FALSE)

## Use only names from features list
features <- featuresList$V2

## Logical Vector to keep only std and mean columns
keepColumns <- grepl("std|mean", features)

## Keep only data we want, and name it human readable
X <- X[, keepColumns]
names(X) <- features[keepColumns]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))
newnames <- names(X) 

## Read ActivityList (to add descriptive names to data set)
activities <- read.table("activity_labels.txt")
activities[,2] = gsub("_", "", tolower(as.character(activities[,2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity" ## Add activity label

## Add labels to activity names for easy understanding.

names(S) <- "subject"
tidyData <- cbind(S, Y, X)
write.table(tidyData, "tidyData.txt")




# group by subject and activity
data.melt = melt(tidyData, id=c("subject", "activity"), measure.vars=newnames)

head(data.melt)
# take mean of each variable within each group
tidyData2 = dcast(data.melt, subject + activity ~ variable, mean)
write.table(tidyData2, "tidyData2.txt")

View(head(tidyData2,30))

## END

