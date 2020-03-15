class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/v1.1.3.tar.gz"
  sha256 "1ebeeb049787a6ac1bce2336ff233ef03c51024e39927798fd3356d9a546c761"

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
