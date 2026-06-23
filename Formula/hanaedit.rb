class Hanaedit < Formula
  desc "macOS native AppKit text editor"
  homepage "https://github.com/webfreakjp/hanaedit"
  url "https://github.com/webfreakjp/hanaedit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on :macos
  depends_on macos: :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/HanaEdit" => "hanaedit"
  end

  test do
    assert_match "HanaEdit 0.1.0", shell_output("#{bin}/hanaedit --version")
  end
end
