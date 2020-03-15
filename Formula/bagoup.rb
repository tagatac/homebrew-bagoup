class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/v1.1.1.tar.gz"
  sha256 "8b082e4b9521a6dac4723ced902fefa53a5e864f1a0fcf7886db3d5daf340f04"

  depends_on "make" => :build

  def install
    system "make"
    cp "bagoup", to_s(bin)
  end

  test do
    assert_equal "Usage:\n  bagoup [OPTIONS]\n", shell_output("#{bin}/bagoup --help")
  end
end
