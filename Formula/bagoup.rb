class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "54bcde75e36dad389af694993c69c1e2f4d55511bb1e4bf9c74549671fd9b0ed"
  license "AGPL-3.0-or-later"

  # bottle do
  #   root_url "https://github.com/tagatac/bagoup/releases/download/v2.6.0"
  #   sha256 cellar: :any_skip_relocation, arm64_tahoe: "afdee685e4e46e141740e4d67e059a158a5f461601c41d6906f781bd5129bd5a"
  # end

  depends_on "go" => :build
  depends_on "make" => :build
  depends_on "weasyprint"

  def install
    system "make", "from-archive"
    mkdir bin.to_s
    cp "bin/bagoup", bin/"bagoup"
  end

  test do
    assert_equal "Usage:\n  bagoup [OPTIONS]\n", shell_output("#{bin}/bagoup --help | head -n 2")
  end
end
