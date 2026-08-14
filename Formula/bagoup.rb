class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.8.0.tar.gz"
  sha256 "6fb520afe86fd39c043c7a389de59234fdc194c7683f3ba99ca09e86d96d10bf"
  license "AGPL-3.0-or-later"

  # bottle do
  #   root_url "https://github.com/tagatac/bagoup/releases/download/v2.7.0"
  #   sha256 cellar: :any_skip_relocation, arm64_tahoe: "b6a97a2b2c53c522159b85cfe01daed44d4c029ab0ca141d7cb709b22a973c8f"
  # end

  depends_on "go" => :build
  depends_on "make" => :build
  depends_on "weasyprint"

  def install
    system "make", "from-archive"
    mkdir bin.to_s
    cp "bin/bagoup", bin/"bagoup"
  end

  test do
    assert_equal "Usage:\n  bagoup [OPTIONS]\n", shell_output("#{bin}/bagoup --help | head -n 2")
  end
end
