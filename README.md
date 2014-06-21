<<<<<<< HEAD
##README

#Files:

README.txt = this file
run_analysis.R = R script to run the analysis
Cookbook.txt = comments on variables and data specifics

#Data source:

Data was obtained from this website (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) as indicated below. The citation for the data is
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

#Licensing:

This is the original licensing information for the data, as provided in the README.txt downloaded with the data:

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


#Data processing:

The data was downloaded from the web using the link given in the course assignment (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Unzipping was performed automatically by my Mac after download. 

The run_analysis.R file has to be saved in the directory "UCI HAR Dataset", which should contain four files (in addition to the R file, which needs to be added after download) after the download and unzipping:
-activity_labels.txt
-features_info.txt
-features.txt
-README.txt

The README.txt contains information about all files as given by the original data source. The subfolders "test" and "train" contain further subfolders "Inertial Signals", these are not used and can be disregarded for this analysis. The files used are
/test/subject_test.txt
/test/X_test.txt
/test/y_test.txt
/train/subject_train.txt
/train/X_train.txt
/train/y_train.txt
activity_labels.txt
features.txt

The analysis is performed as follows:
-read the data - the downloaded .zip needs to be unzipped before running run_analysis.R
-combine the data X_test.txt, y_test.txt and subject_test.txt (and the same for _train.txt), which combines the measurements with the subjectID and activity identifier.
-combine training and test data set
-extract only the values for mean defined as "mean()" and standard deviation defined as "std()" for all measurements
-summarise the data further by calculating the mean of means and the mean of the std columns for each combination of subjectID and activity

The output is a file called "subdatameans.txt", which contains a tab-delimited file of the data frame containing the mean of means and standard deviations. The data can be re-read into R using the read.table function giving "\t" as separator and setting header = TRUE, and should contain 180 rows and 67 columns - 66 for the different measurement variable means, one column combining the subjectID and activity type.

#Workspace

Performing the analysis needs a working installation of R, as well as several additional libraries as indicated at the beginning of the script. The run_analysis.R script is working correctly as such under the following architecture:

> R.Version()
$platform
[1] "x86_64-apple-darwin10.8.0"
$arch
[1] "x86_64"
$os
[1] "darwin10.8.0"
$system
[1] "x86_64, darwin10.8.0"
$status
[1] ""
$major
[1] "3"
$minor
[1] "0.3"
$year
[1] "2014"
$month
[1] "03"
$day
[1] "06"
$`svn rev`
[1] "65126"
$language
[1] "R"
$version.string
[1] "R version 3.0.3 (2014-03-06)"
$nickname
[1] "Warm Puppy"

=======
getting_cleaning_data_CourseProject
===================================

Coursera course assignment repo
>>>>>>> 0b345d8875314111c8bec49c3f8a2c0718ff5bd5
