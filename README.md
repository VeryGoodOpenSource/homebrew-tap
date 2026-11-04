# Very Good Open Source for Homebrew

This is the official [Very Good Open Source][vgv_oss_link] tap for
[Homebrew][homebrew_link].

macOS and Linux users can use these formulae to install and update
[`vgv_ai`][vgv_ai_link], on arm64 and x64.

## Initial setup

If you don't have Homebrew, install it from its [homepage][homebrew_link].

The commands below name the formula in full, which taps this repository and
[trusts][tap_trust_link] only that formula, so there is nothing else to set up.

## Installing

To install `vgv_ai`:

```sh
brew install verygoodopensource/tap/vgv_ai
```

## Updating

`vgv_ai` tells you when a new version is out. To update it:

```sh
brew update
brew upgrade verygoodopensource/tap/vgv_ai
```

## Uninstalling

To uninstall `vgv_ai`:

```sh
brew uninstall vgv_ai
brew untap verygoodopensource/tap
```

## Releasing

Formulae live in [`Formula`](Formula) and are edited through PRs. A release
only changes the tag in each `url` and the `sha256` after it, and
[`bump_vgv_ai`](.github/workflows/bump_vgv_ai.yaml) makes that change: it runs
[`tool/bump_vgv_ai.sh`](tool/bump_vgv_ai.sh) against the latest `vgv_ai`
release and opens or updates the `feat/bump-vgv-ai` PR. `vgv_ai_cli`'s release
workflow dispatches it once the binaries are attached, and it also runs daily
in case a dispatch was missed. Squash and merge the PR once its tests pass.

[homebrew_link]: https://brew.sh
[tap_trust_link]: https://docs.brew.sh/Tap-Trust
[vgv_ai_link]: https://github.com/VeryGoodOpenSource/vgv_ai_cli
[vgv_oss_link]: https://github.com/VeryGoodOpenSource
