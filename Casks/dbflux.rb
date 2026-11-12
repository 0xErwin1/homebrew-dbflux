cask "dbflux" do
  arch arm: "arm64", intel: "amd64"

  version "0.10.0"
  sha256 arm:          "1ca6c283e427b24c8bc566814b5d86e2da901e82f553cf41d98a9eb9ef6a7ca7",
         intel:        "a0e5651f464ef79bc1c49dcad17c1b7d0ddabdf02320cf87fccaa566610ea27b",
         arm64_linux:  "4926a1b0962fdae6a1e332c982598629cf205e6e791a24a402add2f9d01ae3e6",
         x86_64_linux: "03925bc52485a74a73298f2a5ba01ea0dcff665d57ed75c36c3e05cb7ec29e37"

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
