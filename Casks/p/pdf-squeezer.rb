cask "pdf-squeezer" do
  version "4.5.4"
  sha256 :no_check

  url "https://www.witt-software.com/downloads/pdfsqueezer/PDF%20Squeezer.dmg"
  name "PDF Squeezer"
  desc "PDF compression tool"
  homepage "https://witt-software.com/pdfsqueezer/"

  livecheck do
    url "https://www.witt-software.com/downloads/pdfsqueezer/pdfsq#{version.major}-appcast.xml"
    strategy :sparkle, &:short_version
  end

  no_autobump! because: :requires_manual_review

  depends_on macos: ">= :big_sur"

  app "PDF Squeezer.app"

  zap trash: [
    "~/Library/Application Scripts/com.witt-software.PDF-Squeezer",
    "~/Library/Application Scripts/group.witt-software.com.PDF-Squeezer",
    "~/Library/Containers/com.witt-software.PDF-Squeezer",
    "~/Library/Group Containers/group.witt-software.com.PDF-Squeezer",
  ]

  caveats do
    requires_rosetta
  end
end
