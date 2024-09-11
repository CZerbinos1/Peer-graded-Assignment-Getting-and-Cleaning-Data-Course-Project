
# CodeBook for Human Activity Recognition Dataset

## 1. Dataset Information

This dataset contains the results of a study where 30 volunteers performed six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone on their waist. The smartphone captured 3-axial linear acceleration and 3-axial angular velocity. Data was collected at 50Hz, and the dataset includes both training and test data.

## 2. Variables

The dataset contains the following variables:

- **subject**: An integer representing the identifier of the volunteer (range: 1 to 30).
- **activity**: A factor with six levels describing the activity performed: 
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

### Time Domain Signals:

- **timebodyaccelerometer.mean..x/y/z**: Mean of body acceleration in X, Y, Z directions (normalized between -1 and 1).
- **timebodyaccelerometer.std..x/y/z**: Standard deviation of body acceleration in X, Y, Z directions.
- **timegravity.accelerometer.mean..x/y/z**: Mean of gravity acceleration in X, Y, Z directions.
- **timebodyaccelerometerjerk.mean..x/y/z**: Mean of body linear acceleration jerk in X, Y, Z directions.
- **timebodygyroscope.mean..x/y/z**: Mean of angular velocity in X, Y, Z directions from the gyroscope.
- **timebodygyroscopejerk.mean..x/y/z**: Mean of angular velocity jerk in X, Y, Z directions from the gyroscope.
- **timebodyaccelerometermagnitude.mean.**: Mean of the body acceleration magnitude.
- **timegravity.accelerometermagnitude.mean.**: Mean of the gravity acceleration magnitude.
- **timebodygyroscopemagnitude.mean.**: Mean of the gyroscope magnitude.
  
### Frequency Domain Signals:

- **frequencybodyaccelerometer.mean..x/y/z**: Mean of body acceleration in X, Y, Z directions in the frequency domain.
- **frequencybodyaccelerometerjerk.mean..x/y/z**: Mean of body acceleration jerk in X, Y, Z directions in the frequency domain.
- **frequencybodygyroscope.mean..x/y/z**: Mean of gyroscope measurements in X, Y, Z directions in the frequency domain.
- **frequencybodyaccelerometermagnitude.mean.**: Mean of the body acceleration magnitude in the frequency domain.
- **frequencybodygyroscopemagnitude.mean.**: Mean of the gyroscope magnitude in the frequency domain.
- **frequencybodyaccelerometerjerkmagnitude.mean.**: Mean of the body acceleration jerk magnitude in the frequency domain.

## 3. Transformations Applied

The following transformations were applied to the dataset:

1. **Merging the Training and Test Data**: The training and test datasets were combined to create a complete dataset.
2. **Selecting Mean and Standard Deviation Features**: Only the features containing mean and standard deviation measurements were retained.
3. **Activity Labels**: Activity codes were replaced with descriptive activity names (e.g., WALKING, SITTING).
4. **Variable Names**: Variable names were cleaned by converting them to lowercase, replacing special characters (e.g., dashes and parentheses), and using descriptive names.

## 4. Units

- All measurements are normalized to the range [-1, 1] for both time and frequency domain signals.
- Angular velocity (from the gyroscope) is measured in radians/second.
- Linear acceleration is measured in gravity units 'g' (9.81 m/s^2).


