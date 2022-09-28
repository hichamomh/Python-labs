import numpy as np
import numpy.linalg as LA

# v0
# def cknn0(K, x, x_train, class_train):

#     prediction = np.zeros(x.shape[0])

#     # assume data points are ordered in rows (/!\ beware!)
#     for n in range(x.shape[0]):
#         distances = np.squeeze(LA.norm(x[n,:] - x_train, ord=2, axis=1))
#         indices = np.argpartition(distances, K)[:K] # index of the k-smallest values (not garanteed to be in sorted order when returned, but does not sort the full array)
#         id, count = np.unique(class_train[indices], return_counts=True)
#         prediction[n] = id[count.argmax()]

#     return prediction

# # v1
# def cknn0(int K, x, x_train, class_train):

#     cdef Py_ssize_t n_points = x.shape[0]
#     prediction = np.zeros(x.shape[0], dtype=np.float64_t)

#     # assume data points are ordered in rows (/!\ beware!)
#     for n in range(n_points):
#         distances = np.squeeze(LA.norm(x[n,:] - x_train, ord=2, axis=1))
#         indices = np.argpartition(distances, K)[:K] # index of the k-smallest values (not garanteed to be in sorted order when returned, but does not sort the full array)
#         id, count = np.unique(class_train[indices], return_counts=True)
#         prediction[n] = id[count.argmax()]

#     return prediction

# v2: need to add an extra loop when giving type (no broadcast mechanism), need to remove numpy functions to further accelerate
# http://kirste.userpage.fu-berlin.de/chemnet/use/info/libc/libc_15.html

# see how to get better performance than numpy solution

from libc.math cimport sqrt

# cimport cython
# @cython.boundscheck(False)  # Deactivate bounds checking
# @cython.wraparound(False)   # Deactivate negative indexing.

cdef count_unique_elements(int[:] array):
    cdef Py_ssize_t array_size = array.shape[0]
    cdef Py_ssize_t i
    cdef int count = 1
    for i in range(array_size-1):
        if (array[i])


cpdef cknn0(int K, float[:,::1] x, float[:,::1] x_train, int[::1] class_train):

    cdef Py_ssize_t n_points = x.shape[0]
    prediction = np.zeros(x.shape[0], dtype=np.float64c)
    cdef Py_ssize_t n_training_points = x_train.shape[0]
    cdef Py_ssize_t size_training_points = x_train.shape[1]
    distances = np.zeros(x_train.shape[0], dtype=np.float64c)

    assert x_train.shape[1] == x.shape[1] # check same dimension of features
    cdef float tmp

    # cdef float[:] distances
    # cdef size_t[:] indices
    cdef unsigned int[:] count
    cdef Py_ssize_t n, k, l

    # assume data points are ordered in rows (/!\ beware!)
    for n in range(n_points):
        for k in range(n_training_points):
            tmp = 0.
            for l in range(size_training_points):
                tmp += (x[n,l] - x_train[k,l])
            distances[k] = sqrt(tmp)
        indices = np.argpartition(distances, K)[:K] # index of the k-smallest values (not garanteed to be in sorted order when returned, but does not sort the full array)
        id, count = np.unique(class_train[indices], return_counts=True)
        prediction[n] = id[count.argmax()]

    return prediction
