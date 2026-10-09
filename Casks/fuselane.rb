cask "fuselane" do
  version "0.1.0-beta.8"
  sha256 "04b320b0086220d71eec3796105cd1569c3b2b325a7540fbd9f42cb0e1a2cdc8"

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
