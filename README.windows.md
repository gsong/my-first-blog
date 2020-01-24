# Docker Based Django Girls Tutorial Starter - Windows Edition

In order to simplify the setup for [Django Girls workshops][tutorial], let's use
Docker to set up most of our development environment.

**Caveat**: These instructions have been tested thoroughly on Windows 10 and
Windows 7. They should work just as well on Windows 8 and _possibly_ Windows
Vista.


## Installation

Instead of following the directions in [Django Girls Tutorial
Installation][installation], follow these setup instructions instead.


1.  Download [Docker Toolbox][Docker Toolbox]. The
download link you want is the topmost `.exe` file on the release page. It
should have a name like `DockerToolbox-19.03.1.exe`.

1.  Run the Docker Toolbox installer. Use the default options for each
installation step.

1.  There should now be a shortcut named **Docker Quickstart Terminal** on
your Desktop. Double-click that. A command prompt will appear and output a
bunch of text.

    1.  If the Docker Quickstart Terminal seems to stop with an error message,
        try simply closing it and running it again.

    1.  At several points, you will be prompted to give the Terminal
        permission to perform various setup tasks the first time you run it.

    1.  When this setup step has completed, you should see a message similar to
        this:

        ```
        docker is configured to use the default machine with IP 192.168.99.100
        For help getting started, check the docs at https://docs.docker.com
        ```

    1. Close the Docker Quickstart Terminal

1.  Sign up for a free [GitHub][] account, if you don't have one already. If you
    do have an account, make sure you can login with your username and password.

1.  Make a copy of this repo into your own account by [forking this repo][fork].
    To do this, click on the "Fork" button at the top of this page.

1.  Take a little time to read through "[Introduction to the command-line
    interface][cli-intro]", so you can be familiar with how to use your command
    line interface ("CLI").

1.  Open a CLI window to setup the project:
    ```
    cd %TMP%

    powershell -command "$url='https://gist.githubusercontent.com/mike-ce/8e9a9293990567474e69fbaa423b8e84/raw/c9071c4227bd1098d727b51c3e68e8fa1e8703a5/setup.cmd';$dest='setup.cmd';echo `n`n'Downloading. Please wait...';(New-Object System.Net.WebClient).DownloadFile($url, $dest); echo `n`n'Done!'"

    setup.cmd
    ```

1.  [Install a code editor][code-editor].

    Here's a list of editors to consider. All of them will work for macOS,
    Linux, or Windows. In order of biased preference:

    * [Visual Studio Code][vsc] from Microsoft, free.
    * [Atom][] from GitHub, free.
    * [Sublime Text][], $80.

1.  [Create a PythonAnywhere account][pa-account].

These steps will set up your project in `%USERPROFILE%/src/djangogirls`—in other
words, the `src/djangogirls` subdirectory in your user directory.

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
    ```
    cd %USERPROFILE%/src/djangogirls
    ```

1.  Start an interactive container:
    ```sh
    make cli
    ```

There's no need to activate a virtual environment, since our Docker container
*is* our virtual environment.

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

This will start the Django web server in a container. To visit the web site
hosted by the web server go to the URL displayed when this command is run.

The `make runserver` command will otherwise behave exactly as described in the
tutorial.

### Skip the Following Sections

Since we're simplifying the installation process, you can skip (completely or
mostly) the following sections:

* [Python installation][] (skip completely)
* [Django installation][] (skip completely)
* [Deploy!][deploy]
    * [Installing Git][deploy-installing-git] (skip completely)
    * [Starting our Git repository][deploy-start-git-repo] (skip partially)

        Most of this section can be skipped, except at the very end where we
        save our changes:

        ```sh
        git add --all .
        git commit -m "My Django Girls app, first commit"
        ```

    * [Pushing your code to GitHub][deploy-push-code] (skip partially)

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

* [Django Girls Tutorial][tutorial]
* [Local blog](http://localhost:8000/)
* [Local admin](http://localhost:8000/admin)
* PythonAnywhere bash console
* PythonAnywhere "Web" section
* PythonAnywhere hosted blog
* PythonAnywhere hosted admin

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

* bash: Unix commands, path names
* Django: management commands (i.e. `python manage.py …`)
* IPython: Python modules, classes, methods, functions, etc.
* Git: `git` subcommands

### Command History

Both `bash` and `ipython` have command history enabled. This means you can use
`↑` (up arrow) to access commands you've typed before, even across multiple
sessions.


[Atom]: https://atom.io
[Django installation]: https://tutorial.djangogirls.org/en/django_installation/
[Docker Toolbox]: https://github.com/docker/toolbox/releases
[GitHub]: https://github.com
[IPython]: https://ipython.org
[Python installation]: https://tutorial.djangogirls.org/en/python_installation/
[Sublime Text]: https://www.sublimetext.com
[change-settings]: https://tutorial.djangogirls.org/en/django_start_project/#changing-settings
[cli-intro]: https://tutorial.djangogirls.org/en/intro_to_command_line/
[code-editor]: https://tutorial.djangogirls.org/en/installation/#install-a-code-editor
[deploy-installing-git]: https://tutorial.djangogirls.org/en/deploy/#installing-git
[deploy-push-code]: https://tutorial.djangogirls.org/en/deploy/#pushing-your-code-to-github
[deploy-pythonanywhere]: https://tutorial.djangogirls.org/en/deploy/#setting-up-our-blog-on-pythonanywhere
[deploy-start-git-repo]: https://tutorial.djangogirls.org/en/deploy/#starting-our-git-repository
[deploy]: https://tutorial.djangogirls.org/en/deploy/
[first-project]: https://tutorial.djangogirls.org/en/django_start_project/
[fork]: https://github.com/gsong/my-first-blog#fork-destination-box
[installation]: https://tutorial.djangogirls.org/en/installation/
[internet]: https://tutorial.djangogirls.org/en/how_the_internet_works/
[pa-account]: https://tutorial.djangogirls.org/en/installation/#create-a-pythonanywhere-account
[tutorial]: https://tutorial.djangogirls.org/en
[vsc]: https://code.visualstudio.com
