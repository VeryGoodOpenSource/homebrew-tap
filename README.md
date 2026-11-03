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
makes that change:

- [`update_vgv_ai`](.github/workflows/update_vgv_ai.yaml) runs
  [`tool/bump_vgv_ai.sh`](tool/bump_vgv_ai.sh) against a `vgv_ai_cli`
  release, tests the result on every platform, and only then pushes it to
  `main`. `vgv_ai_cli`'s release workflow dispatches it with the new tag, and
  it also runs daily against the latest release in case a dispatch was missed.
  Run it by hand from the Actions tab to retry a release.

`main` has to accept pushes from `github-actions[bot]`, since the update
workflows push to it directly.

## Documentation

`brew help`, `man brew`, or [Homebrew's documentation](https://docs.brew.sh).
