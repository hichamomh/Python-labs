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
    Extension("compute_cy", ["compute_cy.pyx"], include_dirs=[numpy.get_include()]),
]

setup(
    name="compute_cy",
    ext_modules=cythonize(["compute_cy.pyx"], annotate=True, language_level="3"),
)
