# Codebook for the dataset

The explanation of the variables is directly taken from the original explanations (Human Activity Recognition Using Smartphones Data Set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)). The used data is a subset of the original data and only mean and standard deviation of all variables were extracted.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner freuency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, frequencyBodyAccelerometerJerk-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerometerJerkMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

timeBodyAccelerometer-XYZ

timeGravityAccelerometer-XYZ

timeBodyAccelerometerJerk-XYZ

timeBodyGyroscope-XYZ

timeBodyGyroscopeJerk-XYZ

timeBodyAccelerometerMagnitude

timeGravityAccelerometerMagnitude

timeBodyAccelerometerJerkMagnitude

timeBodyGyroscopeMagnitude

timeBodyGyroscopeJerkMagnitude

FrequencyBodyAccelerometer-XYZ

FrequencyBodyAccelerometerJerk-XYZ

FrequencyBodyGyroscope-XYZ

FrequencyBodyAccelerometerMagnitude

FrequencyBodyAccelerometerJerkMagnitude

FrequencyBodyGyroscopeMagnitude

FrequencyBodyGyroscopeJerkMagnitude


The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation
