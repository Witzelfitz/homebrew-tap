# Generated from verified release archives by scripts/release.py.
class Wetter < Formula
  desc "Weather in your terminal with an interactive dashboard"
  homepage "https://github.com/Witzelfitz/wetter"
  version "0.1.1"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/Witzelfitz/wetter/releases/download/v0.1.1/wetter-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "b2802a48d18b75ce46b64af515a3c49f64c73d2cd85fcf1f42e8a21ab4e1993e"
    end

    on_intel do
      url "https://github.com/Witzelfitz/wetter/releases/download/v0.1.1/wetter-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "fa998a660c4cd2cf4164b4ea4fe2f4c44aa69a21b163aaaddb91c41b21b3cb77"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/Witzelfitz/wetter/releases/download/v0.1.1/wetter-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "48e2e998ff54893bd9d8b996d5de380f07559f7dfd06e268a9c5b277b9b5a961"
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
