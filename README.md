# getting-and-cleaning-courseProject
##Course Project for Getting and Cleaning Data in the Coursera Data Science Specialization

###Files Included
This repo contains the following files:
* **tidy_data.txt**: This is a tidy data file in a wide format.  Each row corresponds to one of 30 subjects peforming one of 6 activities, for a total of 180 subject-activity pairs.  For each subject-activity pair, there are 66 variables which display the mean values for each measurement that was itself a mean or sd estimate in the original Samsung data set. These mean and sd measurements were identified by searching for occurences of mean() and std() in the features vector in the Samsung data.
<br><br>
The resulting tidy data file has 180 rows and 68 columns (66 means of variables and identifiers for subject and acitivity).  Thus each variable forms a column and each observtion (a subject-activity pair) forms a row, in accordance with the principals of tidy data outlined by Hadley Wickham here: http://www.jstatsoft.org/v59/i10/paper.
<br><br>
To load this data into R and inspect it, you can download it to your working directory and use: <br>
data <- read.table("tidy_data.txt")<br>
view(data)<br><br>
* **run_analyis.R** : This R script generates the tidy data set uploaded to Coursera.  It requires the "reshape" package. This script executes each of the five steps outlined in the Course Project Description: <br>
  1. Merges the training and the test sets to create one data set. <br>
  2. Extracts only the measurements on the mean and standard deviation for each measurement. <br>
  3. Uses descriptive activity names to name the activities in the data set <br>
  4. Appropriately labels the data set with descriptive variable names. <br>
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  Each step is described with comments in run_analysis.R.  No other scripts are needed.  As noted above, in Step 2, the extract contains only variables contining a mean or sd, identified as those containing mean() or std() in the variable name, as identified in features_info.txt included with the original data.  For additional detail on the variables included, see the codebook.
<br><br>
* **CodeBook.md** : This is the codebook for the tidy data file.
