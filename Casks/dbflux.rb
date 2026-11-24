cask "dbflux" do
  arch arm: "arm64", intel: "amd64"

  version "0.11.1"
  sha256 arm:          "e5d05859adf2b9cd0483168d3aa67ffd6a097dee1b8441fd6a5179db94e7db14",
         intel:        "ae7875a55d0ce1f4aa3adf8c2052bee6ce4cd81d68dbcd2d85224d4ff8cf4a7e",
         arm64_linux:  "6d6d6ff6d33fd4e7285796a5b0ac6a9fa91a7a595cf7a1ed029dffaa3530267f",
         x86_64_linux: "ddf6bd82693c9971e64ce9bb89c8db71480f89f65d264ebfb24711e39cca5aef"

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
