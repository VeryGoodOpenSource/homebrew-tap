# Very Good Open Source for Homebrew

This is the official [Very Good Open Source][vgv_oss_link] tap for
[Homebrew][homebrew_link].

macOS and Linux users can use these formulae to install and update
[`vgv_ai`][vgv_ai_link], on arm64 and x64.

## Installing

If you don't have Homebrew, install it from its [homepage][homebrew_link].

```sh
brew install verygoodopensource/tap/vgv_ai
```

Naming the formula in full taps this repository and [trusts][tap_trust_link]
only that formula, so there is nothing else to set up. Once it is trusted,
`vgv-ai` works as an alias.

To install by the short name instead, tap and trust first:

```sh
brew tap verygoodopensource/tap
brew trust --formula verygoodopensource/tap/vgv_ai
brew install vgv_ai
```

## Updating

`vgv_ai` tells you when a new version is out. To update it:

```sh
brew update
brew upgrade vgv_ai
```

## Uninstalling

```sh
brew uninstall vgv_ai
brew untap verygoodopensource/tap
```

## Releasing

Formulae live in [`Formula`](Formula), and every change lands through a pull
request: `main` is protected. A `vgv_ai` release changes only the formula's
`version`, each `url` and the `sha256` after it. `vgv_ai_cli`'s
[`release_binaries`][release_binaries_link] workflow makes that change once the
binaries are attached and opens a `chore(vgv_ai): X.Y.Z` pull request here,
which requests a review from the code owners and merges by itself once
approved and green.

Pull request titles follow [Conventional Commits][conventional_commits_link],
scoped by formula for formula changes, such as `fix(vgv_ai): …`.

[conventional_commits_link]: https://www.conventionalcommits.org
[homebrew_link]: https://brew.sh
[release_binaries_link]: https://github.com/VeryGoodOpenSource/vgv_ai_cli/blob/main/.github/workflows/release_binaries.yaml
[tap_trust_link]: https://docs.brew.sh/Tap-Trust
[vgv_ai_link]: https://github.com/VeryGoodOpenSource/vgv_ai_cli
[vgv_oss_link]: https://github.com/VeryGoodOpenSource
