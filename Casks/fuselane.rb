cask "fuselane" do
  version "0.1.0-beta.7"
  sha256 "a37adfa273cb1dff00de63c24407d18fe45beeec626e5774678b63a95af8617f"

  url "https://github.com/ArshPunisher/fuselane/releases/download/v#{version}/Fuselane_#{version}_macos-universal.dmg"
  name "Fuselane"
  desc "Download one file over every network you have at once"
  homepage "https://github.com/ArshPunisher/fuselane"

  depends_on macos: :ventura

  app "Fuselane.app"

  # Open source and ad-hoc signed, not notarized (no paid Apple account, by policy).
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Fuselane.app"]
  end

  zap trash: "~/Library/Application Support/app.fuselane"
end
