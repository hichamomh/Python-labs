# Tests and documentation

## Tests

> The [`pytest`](https://docs.pytest.org/en/6.2.x/) framework makes it easy to write small tests, yet scales to support complex functional testing.

It is **very important** to write and run unit tests, to make sure your code works (at least) as expected both for you as you develop but also for other users.

### Install testing dependencies

Intall `pytest`

### Exercise 1

Write unit tests for your code from `lab1` and make sure they all pass.

## Documentation

> [Sphinx](https://www.sphinx-doc.org/en/master/index.html) is a tool that makes it easy to create intelligent and beautiful documentation.

Sphinx is in charge of building the documentation and generating HTML output, but also PDF, epub, ...

Documentation is an **essential** part of your project; you must take some time to document you project properly.

See also:

- [sphinx documentation](https://www.sphinx-doc.org/en/master/usage/configuration.html)

### Docstrings

[Documenting Python code](https://realpython.com/documenting-python-code/) is **key** to your project.

**You must take some time to document your functions, classes, etc.**

In this project, we suggest to use

- the ["Python Docstring Generator" extension](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring), see the [`.vscode/extensions.json`](../../../.vscode/extensions.json) file,
- the Google docstring format as defined at `"autoDocstring.docstringFormat": "google"` in the [`.vscode/settings.json`](../../../.vscode/settings.json) file.

See also:

- [docstrings conventions](https://www.python.org/dev/peps/pep-0257/)

### Install documentation dependencies

Install `sphinx`

### Generate the documentation

Follow the [Sphinx](https://www.sphinx-doc.org/en/master/index.html) tutorial to generate your first documentation.

### Exercise 2

- Write good docstrings for your code from `lab1`
- Generate the corresponding documentation
- [BONUS] customize the documentation with some new sections, LaTeX, etc.
