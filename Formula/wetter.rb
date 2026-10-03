# Generated from verified release archives by scripts/release.py.
class Wetter < Formula
  desc "Weather in your terminal with an interactive dashboard"
  homepage "https://github.com/Witzelfitz/wetter"
  version "0.1.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/Witzelfitz/wetter/releases/download/v0.1.0/wetter-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "268c1585da978f1fda5924530ac98c0be796d3709ddcfc6dab5764b5913eef87"
    end

    on_intel do
      url "https://github.com/Witzelfitz/wetter/releases/download/v0.1.0/wetter-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "918adcaad2ad468896509a55aa3643b9e77b439b4d97d6f60683b01235f57c15"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/Witzelfitz/wetter/releases/download/v0.1.0/wetter-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1c716531e97b404a11cb98b527bcfdb107009d7f0879b7bbb1518bd2faf9948b"
  end

  def install
    bin.install "wetter"
    pkgshare.install "LICENSE", "THIRD_PARTY_LICENSES.txt", "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_equal "wetter #{version}", shell_output("#{bin}/wetter --version").strip
    assert_match "--tui", shell_output("#{bin}/wetter --help")
    assert_match "Bitte einen Ort", shell_output("#{bin}/wetter --json 2>&1", 1)
  end
end
