
# Human Activity Recognition Using Smartphones Dataset

## 1. Dataset Overview

The Human Activity Recognition dataset contains data collected from the accelerometers of Samsung Galaxy smartphones. 
The data tracks various physical activities (e.g., walking, sitting, and laying down) performed by subjects wearing the smartphone.

## 2. Data Collection

- The accelerometer and gyroscope captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
- The dataset contains data collected from 30 volunteers aged 19-48 performing six activities: 
  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.
- The data was pre-processed and partitioned into training (70%) and testing (30%) sets.
- A vector of features was created by calculating variables from the time and frequency domains.

## 3. Files Included

- 'README.md': This file explaining the dataset.
- 'features_info.txt': Information about the features.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## 4. Feature Information

- Time and frequency domain features were extracted from the signals using accelerometer and gyroscope data.
- Variables include mean, standard deviation, median, energy, etc.
- For detailed variable descriptions, see 'features.txt'.

## 5. Notes

- Features are normalized and bounded within [-1, 1].
- Each feature vector is a row in the dataset.
- Activity labels:
  1. WALKING
  2. WALKING_UPSTAIRS
  3. WALKING_DOWNSTAIRS
  4. SITTING
  5. STANDING
  6. LAYING

