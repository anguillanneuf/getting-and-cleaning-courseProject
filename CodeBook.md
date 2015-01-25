# Code book for Coursera Project

## Constructing the tidy data set

To construct the tidy data set, a series of transformations and merges was perfomed using run_analysis.R.  The activity and subject identifications were added to the test and training data, and the resulting two data sets were merged.  The Inertial Signals data was not used to construct the tidy data.<br><br>

This combined data set was then used to generate an extract of all variables containing a mean or standard deviation of a measurement.  These were identified using the grepl R command, looking for the pattern "-mean()-" or "-mean()" or "-std()-" or "-sd()" in the list of varible names, "features.txt."  66 such variables were identified and included in the extract, along with the identification for subjects and activities.<br><br>

Activities were labeled with the descriptive (English-language) name as provided in "activity_labels.txt" and these variable labels in "features.txt" were modified to conform with R style (removing hyphens and parentheses, and cleaning up some duplicated text).  Finally, the reshape package was used to create the tidy data set containing the mean for each of these 66 variables (each one the mean or sd of a measurement) by each subject-activity pair.

The resulting tidy data set contains 68 variables: identifiers for subjects and activities as well as 66 means of variables.  As noted in the "features.txt" file, each measurement is normalized and bounded within [-1,1]

### Variables included in the tidy data set are:
* **subject**: a number from 1 to 30, identifying each of the 30 individual subjects in the data set.
* **activty**: a description of each of six activities for which measurments were taken from each subject.  These activities are: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.  Each individual has means of meaurements for each of these six activities.
<br><br>

* *Means of meaurments*: grouped means of standardized and bounded measurements, for each subject-activity pair, which are themselves the means and standard deviatations of signals in the original data.  For additional detail on the specific measurements, see "features_info.txt" included with the data.  The means included here are:
* **tBodyAcc.mean.X**:  Group mean of  time domain signal for mean of BodyAcc in the X direction
* **tBodyAcc.mean.Y**:  Group mean of  time domain signal for mean of BodyAcc in the Y direction
* **tBodyAcc.mean.Z**:  Group mean of  time domain signal for mean of BodyAcc in the Z direction
* **tBodyAcc.sd.X**:  Group mean of  time domain signal for sd of BodyAcc in the X direction
* **tBodyAcc.sd.Y**:  Group mean of  time domain signal for sd of BodyAcc in the Y direction
* **tBodyAcc.sd.Z**:  Group mean of  time domain signal for sd of BodyAcc in the Z direction
* **tGravityAcc.mean.X**:  Group mean of  time domain signal for mean of GravityAcc in the X direction
* **tGravityAcc.mean.Y**:  Group mean of  time domain signal for mean of GravityAcc in the Y direction
* **tGravityAcc.mean.Z**:  Group mean of  time domain signal for mean of GravityAcc in the Z direction
* **tGravityAcc.sd.X**:  Group mean of  time domain signal for sd of GravityAcc in the X direction
* **tGravityAcc.sd.Y**:  Group mean of  time domain signal for sd of GravityAcc in the Y direction
* **tGravityAcc.sd.Z**:  Group mean of  time domain signal for sd of GravityAcc in the Z direction
* **tBodyAccJerk.mean.X**:  Group mean of  time domain signal for mean of BodyAccJerk in the X direction
* **tBodyAccJerk.mean.Y**:  Group mean of  time domain signal for mean of BodyAccJerk in the Y direction
* **tBodyAccJerk.mean.Z**:  Group mean of  time domain signal for mean of BodyAccJerk in the Z direction
* **tBodyAccJerk.sd.X**:  Group mean of  time domain signal for sd of BodyAccJerk in the X direction
* **tBodyAccJerk.sd.Y**:  Group mean of  time domain signal for sd of BodyAccJerk in the Y direction
* **tBodyAccJerk.sd.Z**:  Group mean of  time domain signal for sd of BodyAccJerk in the Z direction
* **tBodyGyro.mean.X**:  Group mean of  time domain signal for mean of BodyGyro in the X direction
* **tBodyGyro.mean.Y**:  Group mean of  time domain signal for mean of BodyGyro in the Y direction
* **tBodyGyro.mean.Z**:  Group mean of  time domain signal for mean of BodyGyro in the Z direction
* **tBodyGyro.sd.X**:  Group mean of  time domain signal for sd of BodyGyro in the X direction
* **tBodyGyro.sd.Y**:  Group mean of  time domain signal for sd of BodyGyro in the Y direction
* **tBodyGyro.sd.Z**:  Group mean of  time domain signal for sd of BodyGyro in the Z direction
* **tBodyGyroJerk.mean.X**:  Group mean of  time domain signal for mean of BodyGyroJerk in the X direction
* **tBodyGyroJerk.mean.Y**:  Group mean of  time domain signal for mean of BodyGyroJerk in the Y direction
* **tBodyGyroJerk.mean.Z**:  Group mean of  time domain signal for mean of BodyGyroJerk in the Z direction
* **tBodyGyroJerk.sd.X**:  Group mean of  time domain signal for sd of BodyGyroJerk in the X direction
* **tBodyGyroJerk.sd.Y**:  Group mean of  time domain signal for sd of BodyGyroJerk in the Y direction
* **tBodyGyroJerk.sd.Z**:  Group mean of  time domain signal for sd of BodyGyroJerk in the Z direction
* **tBodyAccMag.mean**:  Group mean of  time domain signal for mean of BodyAccMag 
* **tBodyAccMag.sd**:  Group mean of  time domain signal for sd of BodyAccMag 
* **tGravityAccMag.mean**:  Group mean of  time domain signal for mean of GravityAccMag 
* **tGravityAccMag.sd**:  Group mean of  time domain signal for sd of GravityAccMag 
* **tBodyAccJerkMag.mean**:  Group mean of  time domain signal for mean of BodyAccJerkMag 
* **tBodyAccJerkMag.sd**:  Group mean of  time domain signal for sd of BodyAccJerkMag 
* **tBodyGyroMag.mean**:  Group mean of  time domain signal for mean of BodyGyroMag 
* **tBodyGyroMag.sd**:  Group mean of  time domain signal for sd of BodyGyroMag 
* **tBodyGyroJerkMag.mean**:  Group mean of  time domain signal for mean of BodyGyroJerkMag 
* **tBodyGyroJerkMag.sd**:  Group mean of  time domain signal for sd of BodyGyroJerkMag 
* **fBodyAcc.mean.X**:  Group mean of  fast fourier transform for mean of BodyAcc in the X direction
* **fBodyAcc.mean.Y**:  Group mean of  fast fourier transform for mean of BodyAcc in the Y direction
* **fBodyAcc.mean.Z**:  Group mean of  fast fourier transform for mean of BodyAcc in the Z direction
* **fBodyAcc.sd.X**:  Group mean of  fast fourier transform for sd of BodyAcc in the X direction
* **fBodyAcc.sd.Y**:  Group mean of  fast fourier transform for sd of BodyAcc in the Y direction
* **fBodyAcc.sd.Z**:  Group mean of  fast fourier transform for sd of BodyAcc in the Z direction
* **fBodyAccJerk.mean.X**:  Group mean of  fast fourier transform for mean of BodyAccJerk in the X direction
* **fBodyAccJerk.mean.Y**:  Group mean of  fast fourier transform for mean of BodyAccJerk in the Y direction
* **fBodyAccJerk.mean.Z**:  Group mean of  fast fourier transform for mean of BodyAccJerk in the Z direction
* **fBodyAccJerk.sd.X**:  Group mean of  fast fourier transform for sd of BodyAccJerk in the X direction
* **fBodyAccJerk.sd.Y**:  Group mean of  fast fourier transform for sd of BodyAccJerk in the Y direction
* **fBodyAccJerk.sd.Z**:  Group mean of  fast fourier transform for sd of BodyAccJerk in the Z direction
* **fBodyGyro.mean.X**:  Group mean of  fast fourier transform for mean of BodyGyro in the X direction
* **fBodyGyro.mean.Y**:  Group mean of  fast fourier transform for mean of BodyGyro in the Y direction
* **fBodyGyro.mean.Z**:  Group mean of  fast fourier transform for mean of BodyGyro in the Z direction
* **fBodyGyro.sd.X**:  Group mean of  fast fourier transform for sd of BodyGyro in the X direction
* **fBodyGyro.sd.Y**:  Group mean of  fast fourier transform for sd of BodyGyro in the Y direction
* **fBodyGyro.sd.Z**:  Group mean of  fast fourier transform for sd of BodyGyro in the Z direction
* **fBodyAccMag.mean**:  Group mean of  fast fourier transform for mean of BodyAccMag 
* **fBodyAccMag.sd**:  Group mean of  fast fourier transform for sd of BodyAccMag 
* **fBodyAccJerkMag.mean**:  Group mean of  fast fourier transform for mean of BodyAccJerkMag 
* **fBodyAccJerkMag.sd**:  Group mean of  fast fourier transform for sd of BodyAccJerkMag 
* **fBodyGyroMag.mean**:  Group mean of  fast fourier transform for mean of BodyGyroMag 
* **fBodyGyroMag.sd**:  Group mean of  fast fourier transform for sd of BodyGyroMag 
* **fBodyGyroJerkMag.mean**:  Group mean of  fast fourier transform for mean of BodyGyroJerkMag 
* **fBodyGyroJerkMag.sd**:  Group mean of  fast fourier transform for sd of BodyGyroJerkMag 

