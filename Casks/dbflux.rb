cask "dbflux" do
  arch arm: "arm64", intel: "amd64"

  version "0.10.2"
  sha256 arm:          "f40d551faaebad2b45fe11181029e7f6b312f74e1dbffd747bb19bc89d134971",
         intel:        "cf24daaa9b05333cb27edb180d493a51f6f53735ecfef958a1a2160fa7fcade2",
         arm64_linux:  "f85faca8ee0b87be6f93935c66d94ebce4988ef5161875910ff9e5baa0903ecc",
         x86_64_linux: "6945b59c643a6c9638daff0098510ffd0cb95af70eece25613ed3699999e9f87"

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
