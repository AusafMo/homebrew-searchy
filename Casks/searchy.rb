cask "searchy" do
  version "4.0"
  sha256 "fcf26c0ce035f3bb5baca70d84b5a202dd0921e0d22cdf8d4d085a3863bc722e"

  url "https://github.com/AusafMo/searchy/releases/download/v#{version}/Searchy.dmg"
  name "Searchy"
  desc "Hybrid image search tool for macOS using CLIP and OCR"
  homepage "https://ausafmo.com/searchy.html"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "searchy.app"

  zap trash: [
    "~/Library/Application Support/searchy/",
  ]

  caveats <<~EOS
    This is an unsigned build. On first launch:
    1. Right-click the app and select Open
    2. Or go to System Settings > Privacy & Security
    3. Click "Open Anyway" next to the warning
    4. Click "Start Setup" to install Python and CLIP models (~3-5 min)
  EOS
end
