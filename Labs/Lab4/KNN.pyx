import numpy as np
import matplotlib.pyplot as plt

train = np.loadtxt('data/synth_train.txt')
class_train = train[:, 0]
x_train = train[:, 1:]
N_train = train.shape[0]
test = np.loadtxt('data/synth_test.txt')
class_test = test[:, 0]
class_test_1 = test[test[:, 0] == 1]
class_test_2 = test[test[:, 0] == 2]
x_test = test[:, 1:]
N_test = test.shape[0]
class_train_1 = train[train[:, 0] == 1]
class_train_2 = train[train[:, 0] == 2]

def knn_classifier(x_train, class_train, x_test, n_neighbors):
    class_pred = np.empty(x_test.shape[0], dtype=class_train.dtype)
    class_train = class_train.astype(int)

    for q in range(x_test.shape[0]):
        distances = np.linalg.norm(x_train - x_test[q], axis=1)  # Calculate distances
        sorted_indices = np.argsort(distances)  # Sorted indices by distance
        nearest_neighbors = sorted_indices[:n_neighbors]  # Indices of the n_neighbors nearest neighbors
        labels = class_train[nearest_neighbors]  # Classes of the n_neighbors nearest neighbors

        class_pred[q] = np.bincount(labels).argmax()  # Most frequent class among neighbors

    return class_pred

# Example usage
n_neighbors = 5
predicted_classes = knn_classifier(x_train, class_train, x_test, n_neighbors)

import timeit
time = timeit

lowest_error_rate = float('inf')
best_K = 0
best_predicted_classes = None
error_rate = []

for K in range(1, 21):
    predicted_classes = knn_classifier(x_train, class_train, x_test, K)

    training_error_rate = np.sum(predicted_classes[:N_train] != class_train)

    test_error_rate = np.mean(predicted_classes != class_test)
    error_rate.append(test_error_rate)

    if test_error_rate < lowest_error_rate:
        lowest_error_rate = test_error_rate
        best_K = K
        best_predicted_classes = predicted_classes
