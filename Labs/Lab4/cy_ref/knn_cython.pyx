# cython: infer_types=True
import numpy as np
cimport cython

DTYPE = np.int
DTYPE2 = np.double

# note: use cdef for purely c functions (not exported to Python), cpdef is containing C instructions and later called from Python

cpdef long[:] knn_cython(double[:,:] training_data, long[:] training_labels, double[:,:] query, long K):

    # arrays are now C arrays, it's not possible
    # to compare it simply by using == without a for-loop.
    # To be able to compare it to array_2.shape easily,
    # we convert them both to Python tuples.
    assert training_data.shape[0] == training_labels.shape[0]

    prediction = np.zeros(query.shape[0], dtype=DTYPE)
    cdef long[:] prediction_view = prediction

    cdef Py_ssize_t x_max = query.shape[0]
    cdef Py_ssize_t y_max = query.shape[1]

    distance = np.zeros(training_labels.shape[0], dtype=DTYPE2)
    cdef double[:] distance_view = distance
    cdef long[:] id
    nn_labels = np.zeros(K, dtype=DTYPE)
    cdef long[:] nn_labels_view = nn_labels

    # Loop over the queries
    for i in range(x_max):
    # cdef Py_ssize_t i = 0
        # 3. For each example in the data
        for q in range(training_data.shape[0]):
            # 3.1 Calculate the distance between the query example and the current example from the data.
            distance_view[q] = 0.
            for j in range(y_max):
                distance_view[q] += <double>((training_data[q,j] - query[i,j])**2)

        # 4. Sort the ordered collection of distances and indices from smallest to largest (in ascending order) by the distances
        id = np.argsort(distance)
        # 5. Pick the first K entries from the sorted collection
        # 6. Get the labels of the selected K entries
        for k in range(K):
            nn_labels_view[k] = training_labels[id[k]]

        # 7. If regression, return the mean of the K labels
        # 8. If classification, return the mode of the K labels
        prediction_view[i] = np.bincount(nn_labels).argmax()

    return prediction


cpdef double error_rate(long[:] true_labels, long[:] prediction):

    # assumption: true labels = np.array of ints
    # idem for prediction

    cdef Py_ssize_t x_max = true_labels.shape[0]

    assert tuple(true_labels.shape) == tuple(prediction.shape)

    cdef double tmp = 0.

    for x in range(x_max):
        tmp += <double>(abs(true_labels[x] - prediction[x]) > 0)
    cdef double result = tmp/<double>prediction.size
    return result

# first rough version,  would need to be further refined to be properly implemented and have a decent acceleration.
