cask "searchy" do
  version "4.0"
  sha256 "5b98cb6bb273840943b2d6b4481cd7026db24818a7a110319a3007d690dbce6f"

  url "https://github.com/AusafMo/searchy/releases/download/v#{version}/Searchy-v#{version}.dmg"
  name "Searchy"
  desc "Hybrid image search tool for macOS using CLIP and OCR"
  homepage "https://ausafmo.com/searchy.html"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "searchy.app"

  uninstall quit: "ausaf.searchy"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/searchy.app"]
  end

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
