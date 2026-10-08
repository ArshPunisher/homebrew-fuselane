cask "fuselane" do
  version "0.1.0-beta.4"
  sha256 "555b272cd8451bc46061ed9bfcdbb5a1e71624c6094ca735d1a453ce8a598890"

  url "https://github.com/ArshPunisher/fuselane/releases/download/v#{version}/Fuselane_#{version}_macos-universal.dmg"
  name "Fuselane"
  desc "Download one file over every network you have at once"
  homepage "https://github.com/ArshPunisher/fuselane"

  depends_on macos: ">= :ventura"

  app "Fuselane.app"

  # Open source and ad-hoc signed, not notarized (no paid Apple account, by policy).
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Fuselane.app"]
  end

  zap trash: [
    "~/Library/Application Support/app.fuselane",
  ]
end
