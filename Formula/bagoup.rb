class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.3.tar.gz"
  sha256 "06cf4bbf12157faedde3fff874f09e7927039c6e90a76c69353dfbce858498e8"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/tagatac/bagoup/releases/download/v2.3"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "53934fd81aeb4b7782473f64e0c470ecba977ff6b1fd086359109a07467ad49d"
  end

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make", "from-archive"
    mkdir bin.to_s
    cp "bagoup", "#{bin}/bagoup"
  end

  test do
    assert_equal "Usage:\n  bagoup [OPTIONS]\n", shell_output("#{bin}/bagoup --help | head -n 2")
  end
end
