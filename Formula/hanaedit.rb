class Hanaedit < Formula
  desc "macOS native AppKit text editor"
  homepage "https://github.com/webfreakjp/hanaedit"
  url "https://github.com/webfreakjp/hanaedit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2498047afdf6fb9ccf4169b442da321de5b81f33d5360c8a46a2b8d40a0e71e9"
  license "MIT"

  depends_on :macos

  on_macos do
    depends_on macos: :ventura
  end

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/HanaEdit" => "hanaedit"
  end

  test do
    assert_match "HanaEdit 0.1.0", shell_output("#{bin}/hanaedit --version")
  end
end
