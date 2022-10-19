# zsh-dollar-sign-quoter

zsh-dollar-sign-quoter is a zle widget ("zsh plugin") that will automatically put quotes around the argument of certain commands in a single quote if it contains a dollar sign.
The motivation is that the [remix framework](https://remix.run/docs/en/v1/api/conventions#route-file-conventions) recommends using file names with dollar signs, which was inconvenient, so I created it.

## How it works

#### If the argument of the configured command contains a dollar sign, it is converted to an argument with a single quote just before execution.

```zsh
❯ code aa bb$bb cc # => code aa 'bb$bb' cc
```

#### If the argument is already single quoted, it just leaves as it is.

```zsh
❯ code aa 'bb$bb' cc # => do nothing
```

#### If the argument is already escaped, it just leaves as it is.

```zsh
❯ code aa bb\$bb cc # => do nothing
```

## Installation

### Manually

Download `zsh-dollar-sign-quoter.zsh` and source it from your `~/.zshrc file`. Then make sure that you add some prefixes:

```zsh
source ~/somewhere/zsh-dollar-sign-quoter.zsh
ZSH_DOLLAR_SIGN_QUOTER_PREFIXES=('vim' 'code')
```

### [Zinit](https://github.com/zdharma-continuum/zinit)

```
zinit light banyan/zsh-dollar-sign-quoter
```

## License

MIT
