# simple-dotfiles
A relatively minimal set of useful aliases, examples for bash_profile but none that we will use yet, and a sultry vimrc and colors.

Inspiration drawn from dotfiles I received from the instructor ([Hussam Abu-Libdeh](http://0xff.co/)) when I was a student in this class, as well as from [Adam Stewart's dotfiles](https://github.com/adamjstewart/dotfiles.git).

I have created a minimal version to mirror what we are learning in class.

Adam's `dotfiles` repository does a lot of really fancy things that I will not cover.  You are welcome to use his instead, but please do note that it affects a lot more and I will not go through what all of it is doing.

The colors included in this bashrc are only amenable to **dark** terminal background.

## Getting these on your computer

### First, get the files on your computer

```bash
>>> cd ~
>>> git clone https://github.com/cs2043-sp16/simple-dotfiles.git
>>> cd simple-dotfiles/
```

I had originally included a script to do this, but the script was bad in that if you ran it more than once, you would have lost your original dotfiles.

### Make a backup of your original dotfiles if you want

```bash
>>> mkdir ~/dotfiles_backup

# make backups of the bash dotfiles
>>> mkdir ~/dotfiles_backup/bash_backups
>>> cp ~/.bashrc ~/dotfiles_backup/bash_backups/ORIG_BASHRC
>>> cp ~/.bash_profile ~/dotfiles_backup/bash_backups/ORIG_BASH_PROFILE

# make backups of the vimrc, if applicable
>>> mkdir ~/dotfiles_backup/vim
>>> cp ~/.vimrc ~/dotfiles_backup/vim/ORIG_VIMRC

# make a backup of the ~/.profile if it exists
>>> cp ~/.profile ~/dotfiles_backup/profile
```

Note that if you did not already have a `~/.bashrc`, then `cp` will tell you so.  Don't worry, this is not there on OSX.  Similarly, unless you already had a `~/.vimrc` there is nothing to backup.

### Replace the contents of the dotfiles, assuming you are in the simple-dotfiles directory

1. Replace the contents of the bashrc file:

    ```bash
    >>> cat bash_addons/bashrc > ~/.bashrc
    ```

2. Replace the contents of the bash_profile file:

    ```bash
    >>> cat bash_addons/bash_profile > ~/.bash_profile
    ```

3. Replace the vimrc contents, and create the colors directory for vim to behave correctly with the provided vimrc.

    ```bash
    # make the vimrc have the right contents
    >>> cat vim_addons/vimrc > ~/.vimrc

    # create the appropriate directory structure for colors, put the monokai theme there
    >>> mkdir -p ~/.vim/colors/
    >>> cp vim_addons/colors/monokai.vim ~/.vim/colors/
    ```


### The ominous .profile

Because we are using `bash` in this class, we want to source our `.bash_profile` from the `.profile`.  This is the appropriate way to do it, even though you often see people sourcing it from the `bashrc`.  You can accomplish this by simply doing

```bash
>>> cat profile >> ~/.profile
```

Noting that I have two **>>** characters!  That says "append to the end of the file", where a single **>** will overwrite the entire thing.  Depending on what distribution you are running, there may be a lot more in that file that you want to leave alone.

### I don't like these, how do I go back?

Assuming you have made the backups, simply `cat` the backup file you made from your desktop and redirect that to the designated file.  For example, if I wanted to restore the original `bashrc`, then I would just do

```bash
>>> cat ~/dotfiles_backup/bash_backups/ORIG_BASHRC > ~/.bashrc
```

to restore it to the original.  This is particularly meaningful with the Ubuntu virtual machine, as they had different `ls` aliases than I do.  Note again that I am now using a single **>** to say overwrite the entire file.

## I ran your previous script more than once and lost my original dotfiles

Aside from this prompting the extended directions, I have included a folder ORIGINAL with an Ubuntu and Fedora folder inside.  Neither of these come with a `.vimrc` by default, and none of the files we just made / modified existed in OSX.

## Nothing is showing up!

This is because we just modified some important files!

1. Changes to the `~/.vimrc` get reloaded everytime you launch a new instance of vim.
2. Changes to the `~/.bashrc` can be loaded in if you execute this in your terminal

    ```bash
    >>> source ~/.bashrc
    ```

    which is the same thing as

    ```bash
    >>> . ~/.bashrc
    ```
3. Changes to the `~/.bash_profile` and `~/.profile` only show up after you **log out** and then **log in**.  Not quit terminal and restart it, but completely log out and log back in.  You can also `source ~/.profile` to load them both, but that will only take effect for *the current terminal session*, as well as if and when you do have things defined in your `~/.bash_profile` that have meaning, there are often other programs that may need those definitions other than your terminal.  What and when and why depend entirely on what you are doing...

4. Lastly, these all need to be in your *HOME* directory, which is referenced by `~`.  They must all also start with a `.`, which will be true if you were copy pasting my commands above.  So if you do `ls -al ~` you should see `.bashrc`, `.bash_profile`, etc.  If you see `bashrc` without a `.` in front of it, that is why it is not working.

## Bash configurations

Inside the `bash_addons` directory are a bashrc and a bash_profile, that contain some useful shortcuts as well as the terminal colors that I use.  These colors are best used on a dark background, but you are more than welcome to choose your own!

### Color choosing

To include your own, you need to determine what they will be first.  This website is great for helping you do that:

[http://geoff.greer.fm/lscolors/](http://geoff.greer.fm/lscolors/)

It will help you get a reasonable idea of what they will look like.  When you look inside of the `bash_addons/bashrc`, you will see something similar to

```
OS=$(uname)
case "$OS" in
    'Darwin')
        export LSCOLORS='FxFxBxDxCxegedabagacad'
        ;;
    'Linux')
        export LS_COLORS='di=1;35;40:ln=1;35;40:so=1;31;40:pi=1;33;40:ex=1;32;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
        ;;
    *)
        echo "Unknown OS: $OS"
        ;;
esac
```

You will need to change the `LSCOLORS` for `Darwin` (Mac) and `LS_COLORS` for `Linux`, noting that the format (including the variable name) is quite different for the two.  The website linked above gives you both formats!  But it doesn't always get it perfect.  If you have this in your `~/.bashrc`, your terminal will complain if the value in `LS_COLORS` is not formatted properly.

### Customize your terminal background (e.g. to a dark theme)

The colors presented in the example `bashrc` are only appealing on a dark background (mine is a semi-transparent monokai black).  You will need to change the background of your terminal now.

#### Linux Users:

- Open your terminal, and choose Terminal -> Preferences (top-left corner is where it likely is)
- Go to the Profiles tab
- Edit the current one (will likely say "Unnamed")
- My settings:
    - General Tab:
        - Cursor shape: I-Beam
        - Uncheck "Terminal Bell", unfortunately without significant effort only an "audible bell" is setup.  Which is rather annoying.
        - Allow bold text
            - Rewrap on resize
            - I have my font size at 15, using Monospace Regular.
    - Colors Tab:
        - Fedora: should be able to use "Use colors from system theme", I already made these dark for you.
        - Ubuntu: may want to try a different if you don't want that purple, but the Ubuntu colors are
          already quite nice.  To use these colors, since we are going to change our prompt text
          color anyway, you should be able to choose "Green on Black" to get the dark background.
          Alternatively, create your own!
        - Check the "Use transparent background" and slide it to where you want.  Mine is at maybe 11%,
          just enough to see the items behind but not so much that the prompt is hard to read.

#### OSX Users:
- Open a browser and go to here: [https://github.com/stephenway/monokai.terminal](https://github.com/stephenway/monokai.terminal)
- In a terminal, go to ~ and clone the url.
- I am showing you how to use Terminal at the moment, not iTerm!  If you opened Terminal.app, then you should be importing the monokai.terminal.
- From terminal, choose Terminal -> Preferences (if you hit cmd+, (command and comma at same time), this will open the preferences for you, same shortcut works for **many** OSX applications.)
- Go to the "Profiles" tab, and near the bottom middle of the left column that lists all of the options, click on the little Cog Wheel between (-) and (Default), and choose Import
- Navigate to the "Monokai.terminal" file you just cloned in the beginning.
- Customize the Monokai terminal theme a little more:
    - Select Monokai in the list on the left.  Now on the right
        - Text tab:
            - Change font size if needed.  Mine is Menlo Regular 14pt.
            - Cursor:
                - Vertical Bar
                - Blink cursor
        - Window tab:
            - Background: click on the little box next to "Colors and Effects"
                - Drag the opacity slider to where you want.  Mine is at 88.
        - Advanced tab:
            - This should already be set, but make sure "xterm-256color" is slected in "Declare terminal as"
            - Bell:
                - Check Visual bell
                    - Uncheck "Only when sound is muted"
                - Uncheck Audible bell

## VIM Configurations

There are many different configurations you can use, but since I very much approve of what Adam has done, I just stole his.  The original version (including comment styling) came from the dotfiles I received when I was a student, but Adam has been actively updating and modifying it to an almost unhealthy degree.  It will set some pretty incredible features such as code folding, better syntax highlighting, and much much more.  Read the vimrc file to see what is there.
