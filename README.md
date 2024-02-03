# My Dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the folling installed on your system

### Git

```
sudo pacman -S git
```

### Stow
```
sudo pacman -S stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/dreamsofautonomy/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```