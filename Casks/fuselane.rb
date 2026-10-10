cask "fuselane" do
  version "0.1.0-beta.10"
  sha256 "c2873bb20a22fdae507b0cecf51fece7a5a29d7f1c065a5345ae57a2e05be060"

  url "https://github.com/ArshPunisher/fuselane/releases/download/v#{version}/Fuselane_#{version}_macos-universal.dmg"
  name "Fuselane"
  desc "Download one file over every network you have at once"
  homepage "https://fuselane.app"

  depends_on macos: :ventura

  app "Fuselane.app"

  # Open source and ad-hoc signed, not notarized (no paid Apple account, by policy).
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Fuselane.app"]
  end

  zap trash: "~/Library/Application Support/app.fuselane"
end
