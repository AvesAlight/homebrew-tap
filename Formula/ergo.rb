class Ergo < Formula
  desc "Modern IRCv3 server written in Go"
  homepage "https://ergo.chat"
  url "https://github.com/ergochat/ergo/archive/refs/tags/v2.18.0.tar.gz"
  sha256 "5dafcdc9b1eaed0273d54dc274a050d983f79057fbc529af0c52704b1a540680"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.commit=v#{version}")
    pkgshare.install "default.yaml" if File.exist?("default.yaml")
    pkgshare.install "languages" if File.exist?("languages")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ergo --version")
  end
end
