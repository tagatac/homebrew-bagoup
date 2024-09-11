class Bagoup < Formula
  desc "Mac OS Messages export"
  homepage "https://github.com/tagatac/bagoup"
  url "https://github.com/tagatac/bagoup/archive/refs/tags/v2.4.8.tar.gz"
  sha256 "f6d4e0ee0e5a573101ab5943b66010db38dd4ed310a85700d36587dd5c9c0680"
  license "AGPL-3.0-or-later"

  # bottle do
  #   root_url "https://github.com/tagatac/bagoup/releases/download/v2.4.7"
  #   sha256 cellar: :any_skip_relocation, arm64_sonoma: "b40b10def19881211820e8fa1a819746ee7164d8160c2e0617bb0c24475c042f"
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
