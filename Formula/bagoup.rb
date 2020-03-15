class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/v1.1.1.tar.gz"
  sha256 "28327be5c241d4021bc6c0a28aeededb5b72c17889159f267e9b55942bdb81f2"

  depends_on "make" => :build

  def install
    system "make"
    cp "bagoup", to_s(bin)
  end

  test do
    assert_equal "Usage:\n  bagoup [OPTIONS]\n", shell_output("#{bin}/bagoup --help")
  end
end
