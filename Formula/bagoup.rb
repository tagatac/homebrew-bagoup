class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.1.1.tar.gz"
  sha256 "6cafea95c922635f65cbd833c6ed72bb57cdded07a83e29355dc8d468d9cda6f"

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
