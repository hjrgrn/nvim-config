# Neovim Configuration

My personal Neovim configuration.
Very simple configuration that provides lsp servers and formatting for: Rust, C, Python, Javascript, CSS, HTML and Lua; along with other features.
All the plugins are pinned to a specific commit in order to give better stability.


## Neovim version

This configuration is guaranteed to work with this version of Neovim:

Commit: `8b98642002d0506d20628683958cb5c97a0dad80`

Build Neovim [from source](https://github.com/neovim/neovim/blob/master/BUILD.md), expecially if you are using Debian or Ubuntu.


## Usage

Clean up you previous neovim configuration and install the new one with the scripts `setup.sh`:

```bash
git clone 'https://github.com/hjrgrn/nvim-config.git'
cd nvim-config
chmod 760 setup.sh
./setup.sh
```

You can import your previous sessions if you use [startify](https://github.com/mhinz/vim-startify):

```bash
chmod 760 import_session.sh
./import_session.sh
```

Launch Neovim and wait for everything to be installed automatically(it may take a couple of minutes).


## Dependencies

For `nvim-telescope` on ubuntu:

```bash
sudo apt install ripgrep fd-find
```

For lsp `nodejs` and `npm` need to be installed:

how to install them [tutorial](https://www.freecodecamp.org/news/how-to-install-node-js-on-ubuntu/), I install them through [nvm](https://github.com/nvm-sh/nvm);

NOTE: don't install them from Ubuntu's or Debian's repos becouse those versions are probabily too old to be compatible with this setup.


## References

- Inspiration taken from these repos:
    - [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
    - [TJDevries' configuration](https://github.com/tjdevries/config.nvim)
    - [ChristianChiarulli's Lunarvim project](https://github.com/LunarVim)
    - [Lunarvim's starting configuration](https://github.com/LunarVim/Launch.nvim)
    - [Chris' configuration](https://github.com/ChristianChiarulli/nvim)

- Plugin manager:
    - [lazy.nvim](https://github.com/folke/lazy.nvim)

- Lsp manager:
    - [mason.nvim](https://github.com/williamboman/mason.nvim)

- Installing Node.js and npm for Mason on Ubuntu(for arch just install them from pacman):
    - [fcc article](https://www.freecodecamp.org/news/how-to-install-node-js-on-ubuntu/)
    - [node.js](https://nodejs.org/en)
    - [nvm](https://github.com/nvm-sh/nvm)

- All the other plugins used can be found in [plugins.lua](/nvim/lua/user/plugins.lua).
