class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.1.tar.gz"
  sha256 "3623cbf1d4f92a52953f5f87ca2d5131478f803bfda293d84e09c14dd0afd4de"

  bottle do
    root_url "https://github.com/tagatac/bagoup/releases/download/v2.1"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "7f91c5ad7b6ad94ec415aa4e7add74e61b23a141074d409b13351219dfbaffd0"
    sha256 cellar: :any_skip_relocation, monterey: "f9c44340a30cd84a14d9ff18324ddd3731198a1a7b534263ea680a9353c3a070"
  end

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make from-archive"
    mkdir bin.to_s
    cp "bagoup", "#{bin}/bagoup"
  end

  test do
    assert_equal "Usage:\n  bagoup [OPTIONS]\n", shell_output("#{bin}/bagoup --help | head -n 2")
  end
end
