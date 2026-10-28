# Homebrew tap for DBFlux

[DBFlux](https://dbflux.dev) is a keyboard-first database client. This tap installs the release
builds published on [GitHub](https://github.com/0xErwin1/dbflux/releases), on macOS and Linux.

## Install

```bash
brew install --cask 0xErwin1/dbflux/dbflux
```

Installing by the full name trusts only this cask, which Homebrew 6 requires for third-party taps.
Upgrade it with the rest of your casks:

```bash
brew update && brew upgrade --cask dbflux
```

On macOS the cask installs `DBFlux.app` into `/Applications`. On Linux it links the `dbflux`
binary into Homebrew's `bin`.

## macOS and Gatekeeper

DBFlux is not notarized by Apple yet. Without help, Gatekeeper would refuse to open the app after
every install and upgrade, so the cask removes the `com.apple.quarantine` attribute from
`DBFlux.app` once it is installed. If you prefer to approve the app yourself, install the DMG from
the releases page instead.

## Updates

The DBFlux release workflow updates `Casks/dbflux.rb` on every stable release. Release candidates
and nightly builds are not published here. Do not edit the cask by hand: the next release
overwrites it.

## Uninstall

```bash
brew uninstall --cask dbflux
brew uninstall --cask --zap dbflux   # also removes DBFlux's data directory
```
