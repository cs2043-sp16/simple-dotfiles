# simple-dotfiles
A relatively minimal set of useful aliases, examples for bash_profile but none that we will use yet, and a sultry vimrc and colors.

Inspiration drawn from dotfiles I received from the instructor ([Hussam Abu-Libdeh](http://0xff.co/)) when I was a student in this class, as well as from [Adam Stewart's dotfiles](https://github.com/adamjstewart/dotfiles.git).  Please do not contact either of them about this exercise.  Citing is completing.

I have created a minimal version to mirror what we are learning in class.

Adam's `dotfiles` repository does a lot of really fancy things that I will not cover.  You are welcome to use his instead, but please do note that it affects a lot more and I will not go through what all of it is doing.

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
- In a terminal, go to ~/Desktop and clone the url.
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

## Getting these on your computer
Now that you have cloned this repository, simply execute the the `backup_and_replace.sh` script.  Something like the following would suffice:

```bash
> cd ~/Desktop/
> git clone https://github.com/cs2043-sp16/simple-dotfiles.git
> cd simple-dotfiles/
> ./backup_and_replace.sh
```

This will make a backup of any current `bashrc`, `bash_profile`, and related vim tools you may have and import these as is.  For example, the original `~/.bashrc` will now be at `~/.bashrc_ORIGINAL_BACKUP`.  You may want to go through and compare the different aliases in the original (e.g. if you are in Ubuntu), as mine are different (where `ls` is concerned at the very least).
