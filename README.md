# pytest-runner.vim

This is a fork of [vim-rspec](https://github.com/thoughtbot/vim-rspec) to run py.test in a similar fashion.

## Installation

Recommended installation with [vundle](https://github.com/gmarik/vundle):

```vim
Bundle 'mindriot101/vim-pytest-runner'
```

If using zsh on OS X it may be necessary to move `/etc/zshenv` to `/etc/zshrc`.

## Configuration

### Key mappings

Add your preferred key mappings to your `.vimrc` file. For example:

```vim
" pytest-runner.vim mappings
map <Leader>t :call RunCurrentTestFile()<CR>
map <Leader>s :call RunNearestTest()<CR>
map <Leader>l :call RunLastTest()<CR>
map <Leader>a :call RunAllTests()<CR>
```

### Custom command

Overwrite the `g:pytest_command` variable to execute a custom command.

Example:

```vim
let g:pytest_command = "!py.test -s {test}"
```

This `g:pytest_command` variable can be used to support any number of test
runners or pre-loaders. For example, to use
[Dispatch](https://github.com/tpope/vim-dispatch):

```vim
let g:pytest_command = "Dispatch py.test {test}"
```

### Custom runners

Overwrite the `g:pytest_runner` variable to set a custom launch script. At the
moment there are two MacVim-specific runners, i.e. `os_x_terminal` and
`os_x_iterm`. The default is `os_x_terminal`, but you can set this to anything
you want, provided you include the appropriate script inside the plugin's
`bin/` directory.

#### iTerm instead of Terminal

If you use iTerm, you can set `g:pytest_runner` to use the included iterm
launching script. This will run the specs in the last session of the current
terminal.

```vim
let g:pytest_runner = "os_x_iterm"
```

Credits
-------

The conversion to py.test was performed and maintained by Simon Walker.

The original rspec.vim is maintained by [thoughtbot, inc](http://thoughtbot.com/community)
and [contributors](https://github.com/thoughtbot/vim-rspec/graphs/contributors)
like you. Thank you!

It was strongly influenced by Gary Bernhardt's [Destroy All
Software](https://www.destroyallsoftware.com/screencasts) screencasts.

