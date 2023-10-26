import numpy as np
cimport numpy as np
from scipy.stats import mode
 

cdef distance(double[:,:] x_train_view,Py_ssize_t N_train, double[:,:] x_test_view,Py_ssize_t i):

    cdef Py_ssize_t j, d
    cdef double dist, diff
    distances = np.zeros(N_train, dtype=float)
    cdef double[:] distances_view = distances
  
    for j in range(N_train):
        dist = 0
        for d in range(x_train_view.shape[1]):
            diff = x_train_view[j, d] - x_test_view[i, d]
            dist += diff * diff
        distances_view[j] = dist
    return distances_view


cdef knn(double[:,:] x_train, int[:] class_train, double[:,:] x_test, int k):

    cdef Py_ssize_t N_test = x_test.shape[0]
    cdef Py_ssize_t N_train = x_train.shape[0]
    cdef Py_ssize_t i,j,d, idx 
    cdef double dist, diff
    cdef int mode_class

    class_test = np.zeros(N_test, dtype=int)
    cdef int[:] class_test_review = class_test
    cdef double[:,:] x_train_view = x_train
    cdef double[:,:] x_test_view = x_test

    for i in range(N_test):
        distances = distance(x_train_view,N_train, x_test_view,i)
        idx = np.argsort(distances)[:k]
        mode_class = int(mode(class_train[idx])[0])
        class_test_review[i] = mode_class

    return class_test


 
