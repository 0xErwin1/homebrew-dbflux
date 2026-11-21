cask "dbflux" do
  arch arm: "arm64", intel: "amd64"

  version "0.11.0"
  sha256 arm:          "743b386969fbb11148912ffb216764980a91c2f8881b9fe7fceaf6b5fd558ffd",
         intel:        "4baa2bd46e10ae8b063ae60680c8b3db9b2069360b04dfd1880ab2294b54823e",
         arm64_linux:  "03e2eec0a3c1a28baf872ff3dc61431fd5728d02ea93f9acef28a18b02b999d0",
         x86_64_linux: "946d00aa1f16f6d844ef596dbe98f0a27acfb6ff899b17896ef4ca82bcb6d091"

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
