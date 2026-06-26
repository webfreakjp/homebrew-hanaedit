cask "hanaedit" do
  version "0.1.1"
  sha256 "dce52073eed3e764f65ad2356e0a2b5c06bfe6a6a0cdb2c675608b5905735c4a"

  url "https://github.com/webfreakjp/hanaedit/releases/download/v#{version}/HanaEdit-#{version}.zip"
  name "HanaEdit"
  desc "macOS native AppKit text editor"
  homepage "https://github.com/webfreakjp/hanaedit"

  depends_on macos: :ventura

  app "HanaEdit.app"
  binary "#{appdir}/HanaEdit.app/Contents/MacOS/HanaEdit", target: "hanaedit"
end
