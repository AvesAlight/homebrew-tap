# homebrew-tap

Homebrew formulas for [Aves Alight](https://github.com/AvesAlight) tools.

## Usage

```sh
brew tap AvesAlight/tap
brew install AvesAlight/tap/roost
```

Or install individual formulas:

```sh
brew install AvesAlight/tap/ergo   # IRCv3 server (dependency of roost)
brew install AvesAlight/tap/roost  # IRC-based multi-agent coordination
```

## Formulas

- **roost** — IRC-based multi-agent coordination for Claude Code. Source: [AvesAlight/roost](https://github.com/AvesAlight/roost).
- **ergo** — Modern IRCv3 server written in Go. Source: [ergochat/ergo](https://github.com/ergochat/ergo). Repackaged here because there's no homebrew-core formula.
