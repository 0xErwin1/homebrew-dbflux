cask "dbflux" do
  arch arm: "arm64", intel: "amd64"

  version "0.10.1"
  sha256 arm:          "9859c363d6b8752664b575f3632f1ed01769ee25f5da7915e273a18f8cc9de7c",
         intel:        "31fa8c76b189a0f185c82cec9e99cf438f7f491ab4d50ad1625e7e3acf24e4dc",
         arm64_linux:  "0b60dffb41ea802eb62464fa3715b0f466ac173c76b889f860385d3758cf5fe3",
         x86_64_linux: "9d78f7f2552a5526c9f852194c469375c8a3b9a931df200c0b394047542161b3"

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
