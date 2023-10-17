import os
from distutils.core import setup

from Cython.Build import cythonize

os.environ["CC"] = "gcc"

setup(
    ext_modules=cythonize(
        ["helloworld.pyx", "primes.pyx"], annotate=True, language_level="3"
    ),
    script_args=['build_ext', '-b', 'build'],
)
