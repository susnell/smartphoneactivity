### Codebook for Summarizing Data on Human Activity Recognition on Smartphones

The variables in the table produced by the script are

    [1] "activity"  - activity performed (eg. walking, sitting)
    [2] "subject"   - number of the test subject (1-30)      
    [3] - [88]	    - averages of signal data feature estimates
                      (averages only of means and standard deviations)

In tidying the data, only minor changes have been made to the labelling to retain as much information as possible from the original data and experiment setup.

### Change1: Activity labels
Activity labels [1] have been made more concise and readable. 

    activityid  activity    previously	
            1   walking     WALKING
            2   upstairs    WALKING_UPSTAIRS
            3   downstairs	WALKING_DOWNSTAIRS
            4   sitting     SITTING
            5   standing    STANDING
            6   laying      LAYING

### Change2: Variable names
Feature or variable names [3]-[88] have been cleaned of non alphanumerical characters.  

      col  Variable name	    Previously		
      [3]   tBodyAccMeanX       tBodyAcc-mean()-X           
            ...        
      [8]   tBodyAccStdZ        tBodyAcc-std()-Z              
            ...             
      [10]  tGravityAccMeanY	 tGravityAcc-mean()-Y
            ...

To understand what the variables are estimating, please refer to the original feature explanation below.                           

### Explanation of the features in the original data set:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are **and are used in this output**: 

        mean(): Mean value
        std(): Standard deviation
        
The set of variables that were estimated from these signals are **and are omitted from this final output by the script**: 

        mad(): Median absolute deviation 
        max(): Largest value in array
        min(): Smallest value in array
        sma(): Signal magnitude area
        energy(): Energy measure. Sum of the squares divided by the number of values. 
        iqr(): Interquartile range 
        entropy(): Signal entropy
        arCoeff(): Autorregresion coefficients with Burg order equal to 4
        correlation(): correlation coefficient between two signals
        maxInds(): index of the frequency component with largest magnitude
        meanFreq(): Weighted average of the frequency components to obtain a mean frequency
        skewness(): skewness of the frequency domain signal 
        kurtosis(): kurtosis of the frequency domain signal 
        bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
        angle(): Angle between to vectors.

**These additional vectors are also included in this final output**: Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

    gravityMean
    tBodyAccMean
    tBodyAccJerkMean
    tBodyGyroMean
    tBodyGyroJerkMean