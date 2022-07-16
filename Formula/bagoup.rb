class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.0.3.tar.gz"
  sha256 "13156e874bbc7f6d8509b896d5112858201097138f3d822c32bea98768fda203"

  # bottle do
  #   root_url "https://github.com/tagatac/bagoup/releases/download/v2.0.3"
  #   sha256 cellar: :any_skip_relocation, monterey: ""
  # end

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make"
    mkdir bin.to_s
    cp "bagoup", "#{bin}/bagoup"
  end

  test do
    assert_equal "Usage:\n  bagoup [OPTIONS]\n", shell_output("#{bin}/bagoup --help | head -n 2")
  end
end
