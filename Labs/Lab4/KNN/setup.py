from distutils.core import setup, Extension
from Cython.Build import cythonize
import numpy
 
 

setup(
    ext_modules=cythonize("knn.pyx",annotate=True),
    include_dirs=[numpy.get_include()],
    script_args=['build_ext', '-b', 'build'],
)    


setup(
    ext_modules=[
        Extension("knn", ["knn.c"],
                  include_dirs=[numpy.get_include()]),
    ],
)
