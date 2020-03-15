class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/v1.1.2.tar.gz"
  sha256 "ff9b1dd1681b7f81f614dcbeb1c4db699155ea5597f71e3d67e5f5fb309240a2"

  depends_on "make" => :build
  depends_on "go" => :build

  def install
    system "make"
    mkdir bin.to_s
    cp "bagoup", "#{bin}/bagoup"
  end

  test do
    assert_equal "Usage:\n  bagoup [OPTIONS]\n", shell_output("#{bin}/bagoup --help")
  end
end
