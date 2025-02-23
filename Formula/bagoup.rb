class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "9b14fdc109838e67f4fb7402f7eda42149457a69246536e9b361b88986ae9d43"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/tagatac/bagoup/releases/download/v2.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b8a08217b4682a94a3acbe409b2d4fa7c81694b758ad99c7a882262b584cebc4"
  end

  depends_on "go" => :build
  depends_on "make" => :build
  depends_on "weasyprint"

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
