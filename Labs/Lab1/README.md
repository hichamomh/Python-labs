# Lab1 - Objectives

## Command Line Basics 

Follow the instructions in [here](notes/command-line.md)

## Git and Github

- Watch this [video](https://www.youtube.com/watch?v=RGOj5yH7evk) for a Git and Github refresher, recommended speed x2, skip this if you feel confortable with Git already

- Practise the exercises in [here](notes/version-control.md)

After finishing, [Fork](https://github.com/achraf-azize/python_sdia/fork) the original repository.

> A [fork](https://docs.github.com/en/github/collaborating-with-pull-requests/working-with-forks/about-forks) is a copy of a repository that you manage.
> Forks let you make changes to a project without affecting the original repository.
> You can fetch updates from or submit changes to the original repository with [Pull Requests (PRs)](https://github.com/achraf-azize/python_sdia/pulls).

1. [Fork](https://github.com/achraf-azize/python_sdia/fork)
2. Clone the forked repo: `git clone https://github.com/<your-git-username>/python_sdia.git`
3. [Create a remote](https://docs.github.com/en/github/collaborating-with-pull-requests/working-with-forks/configuring-a-remote-for-a-fork).

    ```bash
    cd python-sdia
    git remote -v # list the remotes ; an origin remote should be present
    git remote add upstream https://github.com/achraf-azize/python_sdia.git
    git remote -v # remotes origin and upstream should be listed
    ```

This process allows you to link your local copy of `<your-username>/python_course_sdia` with the original repository `achraf-azize/sdia-python`, so that you can fetch updates from it, e.g., corrections, new course material, etc.

[![git remotes](https://www.tomasbeuzen.com/post/git-fork-branch-pull/featured_hud478d74d48d19bfd1c1c03fc398c8033_312322_720x0_resize_lanczos_2.png)](https://www.tomasbeuzen.com/post/git-fork-branch-pull/)

For example, at the beginning of a practical session, to get the latest course material

```bash
git checkout main # select your main branch
git pull upstream main # fetch and merge commits from guilgautier/sdia-python
```

Note: Merge conflicts may occur. We'll see how to handle this common situation.

## Anaconda and Vscode

Follow the instructions in [here](notes/anaconda-vscode.md)

## Programmation

Practise the exercises in the [notebook](lab1.ipynb)

## Tests and documentation

Follow the instructions in [here](notes/tests-documentation.md)

## To go further

If you still have time, you can explore the following topics:
- [Packaging](notes/packaging.md)
- [Project Workflow](notes/project-workflow.md)
- [Other cool stuff](notes/to-go-further.md)


# Submission Guidelines

To be determined at the end of the lab!

