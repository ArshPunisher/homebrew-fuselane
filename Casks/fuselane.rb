cask "fuselane" do
  version "0.1.0-beta.1"
  sha256 "20ddb8c0ad9a40e6cbd4e9a7177f56f763dd7d75f04c025b28e3fed0fdf5db68"

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
