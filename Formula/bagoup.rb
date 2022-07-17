class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.0.4.tar.gz"
  sha256 "cd2902e4e21c26ba5f79736772be1093ec5020da2f3f98393456b7fe935b3f93"

  bottle do
    rebuild 1
    root_url "https://github.com/tagatac/bagoup/releases/download/v2.0.4"
    sha256 cellar: :any_skip_relocation, monterey: "0f79459f61dd064ccf07c1612243f1c8b684a5d0c3c7ae32edc85e29375301b0"
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
