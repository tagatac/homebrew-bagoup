class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/v1.1.5.tar.gz"
  sha256 "7750524effcd5042fc79ac9833a997e86f694660bb20a0a88d3c1cf8bc7f4732"

  depends_on "make" => :build
  depends_on "go" => :build

  def install
    system "make"
    mkdir bin.to_s
    cp "bagoup", "#{bin}/bagoup"
  end

  test do
    assert_equal "Usage:\n  bagoup [OPTIONS]\n", shell_output("#{bin}/bagoup --help | head -n 2")
  end
end
