class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/v1.1.4.tar.gz"
  sha256 "be0968e2492cee45b66fe5b6c19d451aa6cbe447fbe8db4afe4cf056c776ca82"

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
