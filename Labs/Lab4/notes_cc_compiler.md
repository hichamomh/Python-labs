# Installing cython with Python3: a few notes about C compiler installation

<details>
<summary>Table of content</summary>

- [Installing cython with Python3: a few notes about C compiler installation](#installing-cython-with-python3-a-few-notes-about-c-compiler-installation)
  - [<a id="windows">On windows</a>](#on-windows)
  - [<a id="linux">On Linux</a>](#on-linux)
  - [<a id="mac">On Mac</a>](#on-mac)
  - [<a id="beyond">To go further</a>](#to-go-further)

</details>

______________________________________________________________________

## <a id="windows">On windows</a>

The installation of a C compiler basically follows the indications given [here](https://docs.microsoft.com/fr-fr/cpp/build/walkthrough-compile-a-c-program-on-the-command-line?view=vs-2019). I needed, the installation process is also summarized [here](https://docs.microsoft.com/en-us/visualstudio/install/install-visual-studio?view=vs-2019).

1\. Install the Microsoft Visual C/C++ Compiler (mvsc)

a) go to https://visualstudio.microsoft.com/downloads/

b) choose `Community` version (free download)

c) run the installer (double click)

d) in the `Workloads` menu, tick the panel `Desktop development with C++`, then click on `Install` (or `Install while downloading`)

e) you may be asked to restart the PC to finalize the installation: do so.

2\. Install `cython` in `anaconda` (if not done already in the current `conda` environment you are using)

a) open an anaconda prompt

b) type the following command

```bash
   conda install cython
```

3\. Testing everything went well:

a) take a look at this [post](https://github.com/cython/cython/wiki/CythonExtensionsOnWindows)

b) open an `anaconda` command prompt

c) go to the folder containing the cython example given in the `lab4.zip` archive

d) issue the following instruction (you can add the flag `--compiler=msvc` if needed, this option should normally be the default on windows)

```bash
python setup.py build_ext --inplace
```

e) open python from the `anaconda` prompt

f) type the following commands, after activating the virtual environment you will work in

```python
# cd back to the root of the project
python  # launch python
import example_cy.example_cy.helloworld as hello

hello.printhello()  # you should see "Hello world! printed out in the terminal"
exit()  # close current python process
```

You should see the message "Hello World" displayed in the console.

Caveat: do not use the MinGw64 compiler (strongly discouraged in this specific case, see [this post](https://github.com/cython/cython/wiki/CythonExtensionsOnWindows)).

Remark: another excellent option consists in activating the *Windows Sub-system for Linux (WSL)* (detailed steps available [here](https://docs.microsoft.com/en-us/windows/wsl/install)). You can then simply open a Linux command prompt from Windows, and follow the step by step guide for Linux).

______________________________________________________________________

## <a id="linux">On Linux</a>

The `gcc` and `g++` compilers are installed by default. There should thus be no particular problem if you do the following.

1\. Install `cython` (using `conda` or  `pip`, depending on the package manager you use)

2\. Open a command prompt, and go to the folder containing the cython example given in the `lab4.zip` archive

3\. Issue the following instruction

```bash
   python setup.py build_ext --inplace
```

4\. Launch python and issue the following instructions

```python
# cd back to the root of the project
python  # launch python
import example_cy.example_cy.helloworld as hello

hello.printhello()  # you should see "Hello world! printed out in the terminal"
exit()  # close current python process
```

______________________________________________________________________

## <a id="mac">On Mac</a>

Just [activate `clang` on your machine](https://code.visualstudio.com/docs/cpp/config-clang-mac) (if not done already)

```bash
   clang --version  # checking if clang already active
   xcode-select --install  # in case of error on the line above, execute this command
```

If you instead want to install and use `gcc`, follow the steps described below

1\. You first need to make sure that [homebrew](https://brew.sh/) is installed. TO install it, you may be asked to activate the Xcode command line tool first.

2\. Once homebrew is properly installed, open a command prompt and type

```bash
   brew install gcc g++
```

3\. Add the following lines to your `~\.bashrc` file

```bash
   alias gcc='gcc-9'  # replace by your version of gcc (possibly newer than 9)
   alias g++='g++-9'
   export CC=/usr/local/bin/gcc-9
   export CXX=/usr/local/bin/g++-9
```

4\. Follow steps 1 to 4 from the Linux section.

Caveat: I have not been able to test these guidelines recently. In any case, there are a lot of other useful resources available on the web if needed.

______________________________________________________________________

## <a id="beyond">To go further</a>

- A really useful [step-by-step tutorial for cython with numpy](https://cython.readthedocs.io/en/latest/src/userguide/numpy_tutorial.html);

- (optional) a nice tutorial about interfacing c++ and Python codes is available [here](https://docs.microsoft.com/fr-fr/visualstudio/python/working-with-c-cpp-python-in-visual-studio?view=vs-2019). The focus is put on alternatives to Cython, i.e., CPython and Pybind11. I would personally highly recommend trying Pybind11 for later projects (extremely easy to use, much simpler than Cython in practice. Almost no code adaptation needed if you already have an extended code-base in C/C++).
