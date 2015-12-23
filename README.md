##Readme for run_analysis.R script
##Kris Turner
##12/23/2015

## Project Description
This project involves the processing of a raw data set into a tidy dataset. The raw data comes from a study where accelerometers were placed on 30 different subjects doing six different physical activities: Walking, walking upstairs, walking downstairs, sitting, standing and laying. The run_analysis.R script combines multiple data souces into one cohesive and tidy dataset.

##Creating the tidy datafile
First the following data files were read into R:

x_test.txt - this file contained the accelerometer data for the test group
y_test.txt - this file contained information of what rows of data in x_test.txt correspond to what activity
x_train.txt - this file contained the accelerometer data for the training group
y_train.txt - this file contained information of what rows of data in x_train.txt correspond to what activity
subject_test.txt - this file contained information and what rows of data in the test dataset correspond to what subjects
subject_train.txt - this file contained information and what rows of data in the training dataset correspond to what subjects
features.txt - this file lists all the names of the measured variables contained in x_test.txt and x_train.txt

Next, the x_test and x_train datasets are combined through row binding (rbind). The names for these columns were changed to the list of variables within the features.txt file. 

The same was done for the subject_test and subject_train files. 

Next, all variables not containing the text "mean" or "std" were excluded from the data set. This was achieved using a grepl command.

The label files (y_test, y_train) were also combined via rbind. The resulting comlumn was renamed to "Activity". This column contains numbers (1-6) corresponding to the six human activities listed at the beginning of this file. The script replaces these activity numbers with the actual name of the activity; for example, '1' was replaced with "Walking".

Next, the measured data and the labels were combined. In the script this done by using a cbind command on xcomb and ycomb. Then the subject information is bound to this new table using a cbind command again.

Then the completed dataset (fulldata) is grouped by subject then activity and then the mean of each of those groups is computed.

Finally, the resulting dataset is written to a text file using the write.table command with row.name = FALSE. The file output is called "tidydata.txt".



##Description of the variables in the tiny_data.txt file
As mentioned previously, all variables not related to standard deviations or means were excluded from the final tidy dataset.

###The features_info.txt files describes the project variables as follows:
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz." 

###The file goes on to say:
"Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

In the variable list below the leading 't' implies that it is a time domain variable. A leading 'f' indicates it to be a frequency domain variable. Again, this list is from the features_info.txt file.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The complete list of variables of each feature vector is available in 'features.txt'
An even more detailed explanation of these variables can be found at the following address:
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names

##Sources
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names
The UCI HAR dataset itself
