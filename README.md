# My Dotfiles

This directory contains the dotfiles for my system
![2024-04-03-02:11:40-screenshot](https://github.com/rootankush/dotfiles/assets/141507921/7b9ad164-5fe1-4847-b94a-094239f650e1)

![2024-04-03-02:11:50-screenshot](https://github.com/rootankush/dotfiles/assets/141507921/9d886412-21db-466b-9487-6aca0d522219)


## Requirements

Ensure you have the folling installed on your system

### Git

```
$ sudo pacman -S git
```

### Stow
```
$ sudo pacman -S stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/rootankush/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
## ADD config or UPDATE config

How to add config files to dotfiles or update dotfiles

```
$ cp -r [destination of file] .config
$ git add .config
$ git commit -m "(write somthing here)"
$ git push origin main
$ stow .
```
if after using stow . u get duplicate file error
```
$rm -r [the file u want to delete]
```
 
## Guide Youtube Video

```
https://youtu.be/y6XCebnB9gs?si=X1saNfgNL4CBc_QP
```
