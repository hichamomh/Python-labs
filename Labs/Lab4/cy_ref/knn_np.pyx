import numpy as np


def knn_np(training_data, training_labels, query, K, distance_fn): # data = train_data (reference)

    # Loop of the queries
    prediction = np.zeros(query.shape[0])
    for i in range(query.shape[0]):
        # 3. For each example in the data
        distance = np.zeros(training_labels.shape)
        for q in range(training_data.shape[0]):
            # 3.1 Calculate the distance between the query example and the current example from the data.
            distance[q] = distance_fn(training_data[q,:], query[i,:])

        # 4. Sort the ordered collection of distances and indices from smallest to largest (in ascending order) by the distances
        id = np.argsort(distance)
        labels = training_labels[id]
        # 5. Pick the first K entries from the sorted collection
        # 6. Get the labels of the selected K entries
        nn_labels = labels[:K]

        # 7. If regression, return the mean of the K labels
        # 8. If classification, return the mode of the K labels
        prediction[i] = np.bincount(nn_labels).argmax()

    return prediction

# def error_rate_np(true_labels, prediction):

#     return np.sum((np.abs(true_labels - prediction) > 0.)) / prediction.size
