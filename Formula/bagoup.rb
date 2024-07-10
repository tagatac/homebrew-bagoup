class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.4.6.tar.gz"
  sha256 "478adfc20d988ececef6877597ddf71e73aa3becf9629f307ad0534eb01c0ffd"
  license "AGPL-3.0-or-later"

  # bottle do
  #   root_url "https://github.com/tagatac/bagoup/releases/download/v2.4.5"
  #   sha256 cellar: :any_skip_relocation, arm64_sonoma: "d3be96d2a1f76e71a45ca696b23c10e6da02d737502dc549ff310bd10e6aa145"
  # end

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make", "from-archive"
    mkdir bin.to_s
    cp "bin/typedstream-decode", "#{bin}/typedstream-decode"
    cp "bin/bagoup", "#{bin}/bagoup"
  end

  test do
    assert_equal "Usage:\n  bagoup [OPTIONS]\n", shell_output("#{bin}/bagoup --help | head -n 2")
  end
end
