A directory bookmarking system for the [Fish](http://fishshell.com) shell. This is basically a direct port of [Bashmarks](https://github.com/huyng/bashmarks), but for Fish.

# Installation
1. Copy `fishmarks.fish` into your fish config directory (`~/.config/fish`)
2. Add the following line to your fish init file (`~/.config/fish/config.fish`):

	```source ~/.config/fish/fishmarks.fish```
3. Restart your fish shell and you're ready to go

# Example Usage

```
cd ~/Desktop
s desk
cd ~/Downloads
s dl
j desk
ls -l (p dl)
j dl
l
```

# Available Commands

```
l: list all your fishmarks
j <name>: jump to the directory associated with `<name>`
p <name>: print the directory associated with fishmark `<name>`
s <name>: save the current directory using `<name>`
```

# How does Fishmarks store its data

By default, it's stored at `~/.config/fish/.fishmarks`. If you use multiple machines, my recommendation is to symlink it to a file in your Dropbox folder for cheap, easy synchronization of your fishmarks across machines.
