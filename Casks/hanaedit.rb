cask "hanaedit" do
  version "0.1.2"
  sha256 "b445c3e137f39553bafc0f49ae082255bc6d3d31009e8d80e1cfb42c63680b2e"

  url "https://github.com/webfreakjp/hanaedit/releases/download/v#{version}/HanaEdit-#{version}.zip"
  name "HanaEdit"
  desc "macOS native AppKit text editor"
  homepage "https://github.com/webfreakjp/hanaedit"

  depends_on macos: :ventura

  app "HanaEdit.app"
  binary "#{appdir}/HanaEdit.app/Contents/MacOS/HanaEdit", target: "hanaedit"
end
