# Very Good Open Source Homebrew Tap

Homebrew formulae for [Very Good Open Source](https://github.com/VeryGoodOpenSource)
tools.

## Install

```sh
brew install verygoodopensource/tap/<formula>
```

Homebrew only loads formulae from taps you trust, but naming the formula in
full, as above, trusts it for that `install` or `upgrade`. To install by short
name, or to have a plain `brew upgrade` pick up new versions, tap and trust
once:

```sh
brew tap verygoodopensource/tap
brew trust verygoodopensource/tap
brew install <formula>
```

In a `Brewfile`:

```ruby
tap "verygoodopensource/tap"
brew "<formula>"
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
