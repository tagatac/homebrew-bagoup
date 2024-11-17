class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.4.11.tar.gz"
  sha256 "005c864291d8f0998fe33f9fe5fdf57c1fed18ded681d0bca107097dea77855b"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/tagatac/bagoup/releases/download/v2.4.11"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "eecedca9007c3fd30ae3da46316edc0a2be8ccb4bd6a341a7d928d8d9062cd60"
  end

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
