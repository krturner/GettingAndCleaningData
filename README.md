---
title: "Codebook for run_analysis.R script"
author: "Kris Turner"
date: "12/23/2015"
---

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
General description of the file including:
 - The final dataset is a grouped dataframe of 180 observations and 81 variables

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
