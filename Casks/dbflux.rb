cask "dbflux" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.0"
  sha256 arm:          "101c950b0f2e6eb8454c5afc762106a17aaba15c33f91d23f7e0c98e9f989a64",
         intel:        "f891f9ae4c5902dc95c8eb090f83f9ea0086b573e5eed3d02443e2779692abc2",
         arm64_linux:  "b140dd4722990d5ddbbf5e5842f5da79e3f7e238bfa3faa1707f0c18bef04e31",
         x86_64_linux: "5a6e5ec69d23e959e605ba848b7ed5da8f3c214fa0a42ba125e3546521b93566"

  on_macos do
    url "https://github.com/0xErwin1/dbflux/releases/download/v#{version}/dbflux-macos-#{arch}.dmg"

    app "DBFlux.app"

    zap trash: "~/Library/Application Support/dbflux"
  end
  on_linux do
    url "https://github.com/0xErwin1/dbflux/releases/download/v#{version}/dbflux-linux-#{arch}.tar.gz"

    binary "dbflux"

    zap trash: "~/.local/share/dbflux"
  end

  name "DBFlux"
  desc "Keyboard-first database client"
  homepage "https://dbflux.dev/"

  livecheck do
    url "https://github.com/0xErwin1/dbflux"
    strategy :github_latest
  end

  # The app is not notarized, so Gatekeeper would refuse to open it after
  # every install and upgrade.
  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DBFlux.app"]
    end
  end
end
