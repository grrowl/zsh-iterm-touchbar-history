# zsh iTerm history touchbar

> Display terminal history in the Touchbar

Displays the first word of the past 15 entries, sorted and uniqufied in the touch bar, bound to function keys. Touching any entry will print the shortened to your command line to be executed or autocompleted.

### Requirements

* iTerm2 3.1.beta.3 (OS 10.10+) - [Download](https://www.iterm2.com/downloads.html)
* [zsh](http://www.zsh.org/) shell
* a zsh-framework like [antigen](http://antigen.sharats.me/) or [zgen](https://github.com/tarjoilija/zgen)

**Into iterm2:** Go into `View -> Customize Tool Bar...` and drag & drop the `Fn` module

Here's what mine looks like:

![](touchbar-history.png)

### Installing plugin

#### For oh-my-zsh users

Clone the repo in your plugins directory:

* `$ cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins`
* `$ git clone https://github.com/grrowl/zsh-iterm-touchbar-history.git`

Then add the plugin into your `~/.zshrc`:

```
plugins=(... zsh-iterm-touchbar-history)
```

#### For antigen users

Add the following snippet `~/.zshrc` after the line antigen use oh-my-zsh:

```
antigen theme https://github.com/grrowl/zsh-iterm-touchbar-history
```

#### For Zgen users

Add the following line to your `~/.zshrc` where you're adding your other zsh plugins:

```
zgen load grrowl/zsh-iterm-touchbar-history
```

### Customize

Change the number of entries to look at:

```shell
HISTORY_NUM="30"
```

Change the maximum length of a displayed entry:

```shell
HISTORY_TRUNC="15"
```

### Read more / Credits

* [Original iTerm2 issue for TouchBar support](https://gitlab.com/gnachman/iterm2/issues/5281)
* [Thank's to spaceship-zsh-theme for git functions](https://github.com/denysdovhan/spaceship-zsh-theme/blob/9dbaee2cc6cfe0ac407cf901ebb97894ed279660/spaceship.zsh#L143-L173)
