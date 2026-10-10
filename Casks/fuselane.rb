cask "fuselane" do
  version "0.1.0-beta.9"
  sha256 "a5a802658f94bc5a32090bdb97d170b92ff8e2fbac545c4ae8ae438a16876368"

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
