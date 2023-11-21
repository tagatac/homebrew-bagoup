class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.4.1.tar.gz"
  sha256 "3deae2aa26039b6b7db772927fa7e74ca2d11c7736c98e6cff15793aa72e679d"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/tagatac/bagoup/releases/download/v2.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "72dd258ba4f7dc7ff0956165c937154a3c04a6d7ba8bd84be32050e883240232"
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
