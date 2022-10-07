class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.2.tar.gz"
  sha256 "1b8dcb5d8e2b0a5c859171156ed6af5659f0769089ce47a6164998666ef58f94"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/tagatac/bagoup/releases/download/v2.2"
    sha256 cellar: :any_skip_relocation, monterey: "2c377d3b1e877ea3a8deaf3137c72763ea38a92006c5dddfa1c031341548554d"
  end

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make", "from-archive"
    mkdir bin.to_s
    cp "bagoup", "#{bin}/bagoup"
  end

  test do
    assert_equal "Usage:\n  bagoup [OPTIONS]\n", shell_output("#{bin}/bagoup --help | head -n 2")
  end
end
