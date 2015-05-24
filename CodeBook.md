==================================================================
Coursera Getting and Cleaning Data Course Project Data Set Code Book
Bassed on:
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================

The file DataSet_Step5.txt contains data set of 180 splits (6 activity types by 30 subjects) each split include 12 processed measured data.

==================================================================

Column: 1
Field label: activity_names
Variable: Activity Names
Variable type: Integer
Allowable values: 1 WALKING
		  2 WALKING_UPSTAIRS
	  	  3 WALKING_DOWNSTAIRS
		  4 SITTING
		  5 STANDING
		  6 LAYING
Comments: Description of activity that person perform

Column: 2
Field label: subject_labels
Variable: Subject Labels
Variable type: Integer
Allowable values: 1-30
Comments: Index of the person who performed the activity

Columns: 3
Field label: BodyAcc_mean_X
Variable: Mean Accelerometer data in axis X
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Mean Accelerometer data in axis X that each subject have in each activity 

Columns: 4
Field label: BodyAcc_mean_Y
Variable: Mean Accelerometer data in axis Y
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Mean Accelerometer data in axis Y that each subject have in each activity 

Columns: 5
Field label: BodyAcc_mean_Z
Variable: Mean Accelerometer data in axis Z
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Mean Accelerometer data in axis Z that each subject have in each activity 

Columns: 6
Field label: BodyAcc_std_X
Variable: Standard deviation Accelerometer data in axis X
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Standard deviation Accelerometer data in axis X that each subject have in each activity 

Columns: 7
Field label: BodyAcc_std_Y
Variable: Standard deviation Accelerometer data in axis Y
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Standard deviation Accelerometer data in axis Y that each subject have in each activity 

Columns: 8
Field label: BodyAcc_std_Z
Variable: Standard deviation Accelerometer data in axis Z
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Standard deviation Accelerometer data in axis Z that each subject have in each activity 

Columns: 9
Field label: BodyGyro_mean_X
Variable: Mean Gyroscope data in axis X
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Mean Gyroscope data in axis X that each subject have in each activity 

Columns: 10
Field label: BodyGyro_mean_Y
Variable: Mean Gyroscope data in axis Y
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Mean Gyroscope data in axis Y that each subject have in each activity 

Columns: 11
Field label: BodyGyro_mean_Z
Variable: Mean Gyroscope data in axis Z
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Mean Gyroscope data in axis Z that each subject have in each activity 

Columns: 12
Field label: BodyGyro_std_X
Variable: Standard deviation Gyroscope data in axis X
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Standard deviation Gyroscope data in axis X that each subject have in each activity 

Columns: 13
Field label: BodyGyro_std_Y
Variable: Standard deviation Gyroscope data in axis Y
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Standard deviation Gyroscope data in axis Y that each subject have in each activity 

Columns: 14
Field label: BodyGyro_std_Z
Variable: Standard deviation Gyroscope data in axis Z
Variable type: Integer
Allowable values: [-1,1]
Comments: Average of all Standard deviation Gyroscope data in axis Z that each subject have in each activity

==================================================================

notes:

 - Line by line explanation of transformations and works that performed to clean up the data can be found in commments in run_analysis.R script file
 - To run run_analysis.R original data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip should be unzip into work directory
 - Original data set file is in fixed width format by too big to be read by read.fwf command
 - The result file created with write.table() using row.name=FALSE



example:
==================================================================
> tail(DataSet_Step5[,1:9])
    activity_names subject_labels BodyAcc_mean_X BodyAcc_mean_Y BodyAcc_mean_Z BodyAcc_std_X BodyAcc_std_Y BodyAcc_std_Z BodyGyro_mean_X
175        WALKING             25      0.2635592    -0.01500318     -0.1106882    -0.9541937    -0.9417140    -0.9626673    -0.009231563
176        WALKING             26      0.2783343    -0.01830421     -0.1079376    -0.9659345    -0.9692956    -0.9685625    -0.021893501
177        WALKING             27      0.2486565    -0.01025292     -0.1331196    -0.9340494    -0.9246448    -0.9252161    -0.007960503
178        WALKING             28      0.2501767    -0.02044115     -0.1013610    -0.9365136    -0.9262627    -0.9529784    -0.002826419
179        WALKING             29      0.2612543    -0.02122817     -0.1022454    -0.9430412    -0.9348912    -0.9324915     0.005353612
180        WALKING             30      0.2591955    -0.02052682     -0.1075497    -0.9423331    -0.9162928    -0.9407073    -0.013632036


> DataSetByActivity <- group_by(DataSet_Step5,activity_names)
> summarize(DataSetByActivity, BodyAcc_mean_X=mean(BodyAcc_mean_X))
Source: local data frame [6 x 2]

      activity_names BodyAcc_mean_X
1             LAYING      0.2617563
2            SITTING      0.2763071
3           STANDING      0.2880303
4            WALKING      0.2676629
5 WALKING_DOWNSTAIRS      0.2791965
6   WALKING_UPSTAIRS      0.2728633

