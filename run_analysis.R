## What follows is a script to process the data for the Coursera course project
## The data is read into varibles which are then combined and finally summarized
## by Subject and Activity as requested by the assigment instructions into a variable
## named "final"

#If dplyr is not installed then install it!
if (!is.element('dplyr', installed.packages()[,1]))
    install.packages('dplyr', dep = TRUE)

#Load dplyr
library(dplyr)

#Test set
xtest <- read.table(file = './UCI HAR Dataset/test/X_test.txt')

#Test labels
ytest <- read.table(file = './UCI HAR Dataset/test/y_test.txt')

#Training set
xtrain <- read.table(file = './UCI HAR Dataset/train/X_train.txt')

#Training labels
ytrain <- read.table(file = './UCI HAR Dataset/train/y_train.txt')

#List of all features
features <- read.table(file = './UCI HAR Dataset/features.txt')

#Subject_test and Subject_train
subtest <- read.table(file = './UCI HAR Dataset/test/subject_test.txt')
subtrain <- read.table(file = './UCI HAR Dataset/train/subject_train.txt')

#Combine subject_test and subject_train by rows
subcomb <- rbind(subtest, subtrain)

#Rename subject information column from "V1" to "Subject"
names(subcomb) <- 'Subject'

#Combine xtest and xtrain by rows
xcomb <- rbind(xtest, xtrain)

#Rename xcomb columns to feature names
names(xcomb) <- features$V2

#Select only the columns where the column names contains either 'std' or 'mean'
tomatch <- c('mean', 'std')
xcomb <- xcomb[,grepl(paste(tomatch,collapse='|'), colnames(xcomb))]


#Combine lables for test and training sets
ycomb <- rbind(ytest, ytrain)

#Rename ycomb column to "Activity"
names(ycomb) <- 'Activity'

#Rename activities
ycomb[ycomb=='1']<-"Walking"
ycomb[ycomb=='2']<-"Walking_upstairs"
ycomb[ycomb=='3']<-"Walking_downstairs"
ycomb[ycomb=='4']<-"Sitting"
ycomb[ycomb=='5']<-"Standing"
ycomb[ycomb=='6']<-"Laying"

#Combine x and y data together (recorded data and activity class info)
xycomb <- cbind(xcomb, ycomb)

#Combine our combined xycomb data table with the subject information
fulldata <- cbind(xycomb, subcomb)

#From fulldata, create a dataset with the avg of each variable for each activity and each subject
final <- fulldata %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

#Write tidy data (final) into .txt file
write.table(final, 'tidydata.txt', row.name = FALSE)
