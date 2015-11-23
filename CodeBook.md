# Human Activity Recognition through Smartphones

## Short description of the project

Researchers at UC Irvine measured six activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) with a group of 30 volunteers between the ages of 19-48 who were all wearing a Samsung Galaxy S II smartphone. 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "Read more information about the project at UCI" ]

## Study design and data processing
Volunteers were randomly separated into two groups. 70% were selected to generate the training data; 30% generated the test data.

## Collection of the raw data

For each of the six activities the volunteers performed, 3-axial linear acceleration and angular velocity were captured through the smartphone's embedded accelerometer and gyroscope. Noise filters were applied to these sensor signals, then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

## Creating the tidy datafile

Create the tidy data file simply by running the run_analysis.R script on your own computer.

## Cleaning of the data

To clean the data, first all of the measurements for each set are read into R and combined. Then, the relevant columns are saved and a new dataframe is created with only that information. Six subsets are created from this dataframe, one for each activity. Then, on each activity dataframe, the means for each column then, the mean from each column mean for each subject is calculated.

## Description of the variables in the tiny_data.txt file

The tiny data has 6 variables (walkingMeans, walkingUpstairsMeans, walkingDownstairsMeans, sittingMeans, standingMeans, layingMeans ) and 30 rows, one for each subject. The measurement in each field is the mean of all measurements from that subject for that activity in g's.