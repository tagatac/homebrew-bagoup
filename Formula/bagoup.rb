class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "02bd220b416c87158a9cb854d6cd9737d5287042ba92327d0ada1d8f7ae41158"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, monterey: "9048304ee250e7a685a7a6f8a27a8e1b5fe39b9140ce8a5748313573b4ab16c8"
  end

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
