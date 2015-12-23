---
title: "Codebook for run_analysis.R script"
author: "Kris Turner"
date: "12/23/2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
This project involves the processing of a raw data set into a tidy dataset. The raw data comes from a study where accelerometers were placed on 30 different subjects doing six different physical activities: Walking, walking upstairs, walking downstairs, sitting, standing and laying. The run_analysis.R script combines multiple data souces into one cohesive and tidy dataset.

##Creating the tidy datafile
First the following data files were read into R:

x_test.txt - this file contained the accelerometer data for the test group
y_test.txt - this file contained information of what rows of data in x_test.txt core

x_train.txt - this file contained the accelerometer data for the training group



First the l

###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/

###Cleaning of the data
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

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
