class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.4.10.tar.gz"
  sha256 "7d003523c133c7c1453a2b371ea508e7ca95c7df6e504132e22add89c97bd966"
  license "AGPL-3.0-or-later"

  # bottle do
  #   root_url "https://github.com/tagatac/bagoup/releases/download/v2.4.8"
  #   sha256 cellar: :any_skip_relocation, arm64_sonoma: "31c41389563f14e948a29cb2806111698704fd0fddaeb450cbf1e0e1d56d21ee"
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
