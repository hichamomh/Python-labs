from distutils.core import setup
from distutils.extension import Extension

import numpy
from Cython.Build import cythonize

# extensions = [
#     Extension("primes", ["primes.pyx"],
#         include_dirs=[...],
#         libraries=[...],
#         library_dirs=[...]),
#     # Everything but primes.pyx is included here.
#     Extension("*", ["*.pyx"],
#         include_dirs=[...],
#         libraries=[...],
#         library_dirs=[...]),
# ]

extensions = [
    Extension("cknn0", ["cknn0.pyx"], include_dirs=[numpy.get_include()]),
    # Extension("cknn1", ["cknn1.pyx"],
    #     include_dirs=[numpy.get_include()]),
]

setup(
    # name="knn",
    ext_modules=cythonize(
        ["cknn0.pyx"], annotate=True, language_level="3"
    ),  # , "cknn1.pyx"
)

# -Option 2
# from distutils.core import setup
# from Cython.Build import cythonize
# import numpy

# setup(
#     name="Basic knn app",
#     ext_modules = cythonize("knn_cython.pyx", include_path=[numpy.get_include()],annotate=True), # include path only needed if I use cimport numpy in the code
# )
# ---

# -Option 3
# from distutils.core import setup
# from Cython.Build import cythonize

# import Cython.Compiler.Options
# Cython.Compiler.Options.annotate = True

# setup(
#     ext_modules = cythonize("knn_cython.pyx", annotate=True)
# )
# ---

# Comment: a useful additional switch is -a which will generate a document
#  yourmod.html) that shows which Cython code translates to which C code line
#  by line. Represented by `annotate` parameter here. Make sure all the
#  previously generated files are deleted to make sure the .html report is
# produced.

# Compile cython code: python3 setup.py build_ext --inplace to build
# cython3 -a knn_cython.pyx

# Useful links:
# 1. https://cython.readthedocs.io/en/latest/src/userguide/numpy_tutorial.html#numpy-tutorial
# 2. https://cython.readthedocs.io/en/latest/src/userguide/memoryviews.html#memoryviews
# 3. language level: https://stackoverflow.com/questions/34603628/how-to-specify-python-3-source-in-cythons-setup-py
