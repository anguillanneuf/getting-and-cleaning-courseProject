# getting-and-cleaning-courseProject
##Course Project for Getting and Cleaning Data in the Coursera Data Science Specialization

## Files Included
This repo contains the following files:
* tidy_data.txt: This is a tidy data file in a wide format.  Each row corresponds to one of 30 subjects peforming one of 6 activities, for a total of 180 subject-activity pairs.  For each subject-activity pair, there are 66 variables which display the mean values for each measurement that was itself a mean or sd estimate in the original Samsung data set. These mean and sd measurements were identified by searching for occurences of mean() and std() in the features vector in the Samsung data.
<br><br>
The resulting tidy data file has 180 rows and 68 columns (66 means of variables and identifiers for subject and acitivity).  Thus each variable forms a column and each observtion (a subject-activity pair) forms a row, in accordance with the principals of tidy data outlined by Hadley Wickham here: http://www.jstatsoft.org/v59/i10/paper.
<br><br>
To load this data into R and inspect it, save it to your working directory and use: <br>
>data <- read.table("tidy_data.txt")<br>
>view(data)
* run_analyis.R : This R script generates the tidy data set uploaded to Coursera.  It requires the "reshape" package. This script executes each of the five steps outlined in the Course Project Description:
* 
