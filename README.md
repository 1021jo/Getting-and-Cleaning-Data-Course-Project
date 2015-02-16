==================================================================
Human Activity Recognition Using Smartphones Dataset


This is a clean dataset based on the datasets provided at the below link for future data analysis:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* For the limited time, the datasets in the Inertial Signals folder were not included in this work. 


The clean-up work included:
=======================================
- Combined the test and train datasets
- Combined activity and subject information as the first 2 columns
- Extracted only the measurements on the mean and standard deviation for each measurement
- Calculated the average of each variable for each activity and each subject


This dataset contains 180 records by 6 activities and 30 subjects. For each record it is provided with 81 specific variables explained in the codebook.


The dataset includes the following files:
=========================================

- 'README.md’

- ‘cleandata.txt': The tidy dataset.

- ‘codebook.md’: List of all variables.




Original License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
