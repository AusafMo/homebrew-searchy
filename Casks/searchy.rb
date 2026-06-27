cask "searchy" do
  version "4.3"
  sha256 "92a41b835399a77baf9de47fe1f85e769176e8a86e182d8ee5215ca718604bb4"

  url "https://github.com/AusafMo/searchy/releases/download/v#{version}/Searchy-v#{version}.dmg",
      verified: "github.com/AusafMo/searchy/"
  name "Searchy"
  desc "Hybrid image search tool for macOS using CLIP and OCR"
  homepage "https://ausafmo.com/searchy.html"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "searchy.app"

  uninstall quit: "ausaf.searchy"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/searchy.app"]
  end

  zap trash: [
    "~/Library/Application Support/searchy/",
    "~/Library/Preferences/ausaf.searchy.plist",
    "~/Library/Preferences/MdAsf.searchy.plist",
  ]

  caveats <<~EOS
    This is an unsigned build. On first launch:
    1. Right-click the app and select Open
    2. Or go to System Settings > Privacy & Security
    3. Click "Open Anyway" next to the warning
    4. Click "Start Setup" to install Python and CLIP models (~3-5 min)
  EOS
end
