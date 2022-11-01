# zsh-auto-escape

zsh-auto-escape is a zle widget ("zsh plugin") that will automatically escapes around the argument of certain commands just like when we hit the tab key in command line shells.
The motivation is that the [remix framework](https://remix.run/docs/en/v1/api/conventions#route-file-conventions) recommends using file names with dollar signs, which was inconvenient, so I created it.

## How it works

#### If the argument of the configured command contains a special charcter, it's converted to the argument with being escaped just before execution.

```zsh
❯ code aa bb$bb cc # => code aa bb\$bb cc
```

#### If the argument is already escaped, it just leaves as it is.

```zsh
❯ code aa bb\$bb cc # => do nothing
```

## Installation

### Manually

Download `zsh-auto-escape.zsh` and source it from your `~/.zshrc file`. Then make sure that you add some prefixes:

```zsh
source ~/somewhere/zsh-auto-escape.zsh
ZSH_AUTO_ESCAPE_PREFIXES=('vim' 'code')
```

### [Zinit](https://github.com/zdharma-continuum/zinit)

```
zinit light banyan/zsh-auto-escape
```

## License

MIT
