# Very Good Open Source Homebrew Tap

Homebrew formulae for [Very Good Open Source](https://github.com/VeryGoodOpenSource)
tools.

## Install

```sh
brew install verygoodopensource/tap/<formula>
```

Homebrew only loads formulae from taps it [trusts](https://docs.brew.sh/Tap-Trust).
Installing a formula by its full name, as above, trusts that formula, so a
plain `brew upgrade` keeps it up to date afterwards. To install by short name,
trust the formula first:

```sh
brew tap verygoodopensource/tap
brew trust --formula verygoodopensource/tap/<formula>
brew install <formula>
```

In a `Brewfile`, use the full name and `trusted: true`. Without it,
`brew bundle` refuses to install the formula, even by its full name:

```ruby
tap "verygoodopensource/tap"
brew "verygoodopensource/tap/<formula>", trusted: true
```

## Formulae

| Formula  | Description                                        | Source                                                                            |
| -------- | -------------------------------------------------- | --------------------------------------------------------------------------------- |
| `vgv_ai` | Configures Very Good AI coding agents and tooling. | [VeryGoodOpenSource/vgv_ai_cli](https://github.com/VeryGoodOpenSource/vgv_ai_cli) |

## Updating a formula

Formulae live here and are edited by hand through PRs. Only the release tag
in each `url` and the `sha256` after it change with a release, and a workflow
opens a PR for it:

- [`bump_vgv_ai`](.github/workflows/bump_vgv_ai.yaml) runs
  [`tool/bump_vgv_ai.sh`](tool/bump_vgv_ai.sh), which moves
  `Formula/vgv_ai.rb` to the latest `vgv_ai_cli` release, and opens or
  updates the `feat/bump-vgv-ai` PR. `vgv_ai_cli`'s release workflow
  dispatches it once the binaries are attached, and it also runs daily in case
  a dispatch was missed.

The tests run on the bump PR like any other, so squash and merge it once
they pass.

## Documentation

`brew help`, `man brew`, or [Homebrew's documentation](https://docs.brew.sh).
