# Docker Based Django Girls Tutorial Starter

In order to simplify the setup for [Django Girls workshops][tutorial], let's use
Docker to set up most of our development environment.

**Caveat**: These instructions have been tested thoroughly on macOS, and should
work just as well on most Linux based systems.

Windows users should refer to [the Windows README](docs/windows/README.md).

## Installation

Instead of following the directions in [Django Girls Tutorial
Installation][installation], follow these setup instructions instead.

1.  [Install Docker][docker platforms]—follow the instructions for your specific
    operating system.
1.  Sign up for a free [GitHub][] account, if you don't have one already. If you
    do have an account, make sure you can login with your username and password.
1.  Make a copy of this repo into your own account by [forking this repo][fork].
    To do this, click on the "Fork" button at the top of this page.
1.  Take a little time to read through "[Introduction to the command-line
    interface][cli-intro]", so you can be familiar with how to use your command
    line interface ("CLI").
1.  Open a CLI window to setup the project:

    ```sh
    cd /tmp
    curl -OL https://cdn.jsdelivr.net/gh/gsong/my-first-blog/setup.sh
    source setup.sh
    ```

1.  [Install a code editor][code-editor].

    Here's a list of editors to consider. All of them will work for macOS,
    Linux, or Windows. In order of biased preference:

    - [Visual Studio Code][vsc] from Microsoft, free.
    - [Atom][] from GitHub, free.
    - [Sublime Text][], \$80.

1.  [Create a PythonAnywhere account][pa-account].

These steps will set up your project in `${HOME}/src/djangogirls`—in other
words, the `src/djangogirls` subdirectory in your home directory.

🎉 You're ready to start the tutorial! Continue with [How the Internet
works][internet]. Note some minor changes you'll have to keep in mind as you
follow the tutorial.

## Changes from the Tutorial

### Command Line Operations

You'll be using Docker containers throughout the tutorial to do your work. It's
best to keep two CLI windows open at the same time: one to run the command line,
and another to run your web server.

#### Command Line

👉 Whenever you see mention of "open up a command line":

1.  Open up a CLI window
1.  Navigate to the project directory

    ```sh
    cd ${HOME}/src/djangogirls
    ```

1.  Start an interactive container:
    ```sh
    make cli
    ```

There's no need to activate a virtual environment, since our Docker container
_is_ our virtual environment.

Instead of the prompt you see in the tutorial instructions:

```sh
(myvenv) ~/djangogirls$
```

You'll instead see:

```sh
root@app:~/src/djangogirls$
```

#### Run Django Web Server

👉 Whenever you see mention of `python manage.py runserver`, use the following
instead:

```sh
make runserver
```

This will start the Django web server in a container, and will behave exactly as
described in the tutorial.

### Skip the Following Sections

Since we're simplifying the installation process, you can skip (completely or
mostly) the following sections:

- [Python installation][] (skip completely)
- [Django installation][] (skip completely)
- [Deploy!][deploy]

  - [Installing Git][deploy-installing-git] (skip completely)
  - [Starting our Git repository][deploy-start-git-repo] (skip partially)

    Most of this section can be skipped, except at the very end where we
    save our changes:

    ```sh
    git add --all .
    git commit -m "My Django Girls app, first commit"
    ```

  - [Pushing your code to GitHub][deploy-push-code] (skip partially)

    Since we've already cloned from a repo, we can skip most of the steps
    here. The only thing we need to do is:

    ```sh
    git push
    ```

  Continue following everything as-is from [Setting up our blog on
  PythonAnywhere][deploy-pythonanywhere].

### Minor Changes

#### [Your first Django project!][first-project]

##### [Changing settings][change-settings]

Instead of setting:

```py
ALLOWED_HOSTS = ['127.0.0.1', '<your_username>.pythonanywhere.com']
```

Set it to:

```py
ALLOWED_HOSTS = ['*']
```

## Hints on Window Management

During the course of the tutorial, you'll need to juggle lots of different
windows. This is one suggested way to arrange the different windows on your
screen. You should have three applications running:

1.  Command line interface console
2.  Browser
3.  Editor

### CLI Console

You should have two windows or tabs for working with the command line. Keep one
dedicated for typing and running commands, and another one for running the
Django web server, which you'll rarely need to touch.

If you use two windows, it's easier if you stack them top and bottom.

### Browser

Use two separate windows to manage all the pages.

#### Window #1

Lay out your first window with the following tabs, in order:

- [Django Girls Tutorial][tutorial]
- [Local blog](http://localhost:8000/)
- [Local admin](http://localhost:8000/admin)
- PythonAnywhere bash console
- PythonAnywhere "Web" section
- PythonAnywhere hosted blog
- PythonAnywhere hosted admin

Keep this window persistent and consistent throughout your day.

#### Window #2

Use this window for any research you need to do.

### Editor

Make sure your editor is rooted to `${HOME}/src/djangogirls` for convenience.
Each editor will have its own way of accomplishing this.

## Enhancements

### IPython

Instead of the plain Python console, we've installed [IPython][], which is much
more powerful. To use it, just type `ipython` in place of `python` or `python3`.

### Autocompletion

Since CLI commands are sometimes complex and prone to typos, we use
autocompletion to help us with the task. To use autocomplete, simply press the
`TAB` key, and your computer will make suggestions.

The Docker image has the following autocompletion installed for your
convenience:

- bash: Unix commands, path names
- Django: management commands (i.e. `python manage.py …`)
- IPython: Python modules, classes, methods, functions, etc.
- Git: `git` subcommands

### Command History

Both `bash` and `ipython` have command history enabled. This means you can use
`↑` (up arrow) to access commands you've typed before, even across multiple
sessions.

[atom]: https://atom.io
[change-settings]: https://tutorial.djangogirls.org/en/django_start_project/#changing-settings
[cli-intro]: https://tutorial.djangogirls.org/en/intro_to_command_line/
[code-editor]: https://tutorial.djangogirls.org/en/installation/#install-a-code-editor
[deploy-installing-git]: https://tutorial.djangogirls.org/en/deploy/#installing-git
[deploy-push-code]: https://tutorial.djangogirls.org/en/deploy/#pushing-your-code-to-github
[deploy-pythonanywhere]: https://tutorial.djangogirls.org/en/deploy/#setting-up-our-blog-on-pythonanywhere
[deploy-start-git-repo]: https://tutorial.djangogirls.org/en/deploy/#starting-our-git-repository
[deploy]: https://tutorial.djangogirls.org/en/deploy/
[django installation]: https://tutorial.djangogirls.org/en/django_installation/
[docker platforms]: https://docs.docker.com/install/#supported-platforms
[first-project]: https://tutorial.djangogirls.org/en/django_start_project/
[fork]: https://github.com/gsong/my-first-blog/fork
[github]: https://github.com
[installation]: https://tutorial.djangogirls.org/en/installation/
[internet]: https://tutorial.djangogirls.org/en/how_the_internet_works/
[ipython]: https://ipython.org
[pa-account]: https://tutorial.djangogirls.org/en/installation/#create-a-pythonanywhere-account
[python installation]: https://tutorial.djangogirls.org/en/python_installation/
[sublime text]: https://www.sublimetext.com
[tutorial]: https://tutorial.djangogirls.org/en
[vsc]: https://code.visualstudio.com
