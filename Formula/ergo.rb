class Ergo < Formula
  desc "Modern IRCv3 server written in Go"
  homepage "https://ergo.chat"
  version "2.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ergochat/ergo/releases/download/v2.18.0/ergo-2.18.0-macos-arm64.tar.gz"
      sha256 "7ef1207d92e049e8162e2973f9251c2a8d901a058fd1973ea12831cd778d90d1"
    end
    on_intel do
      url "https://github.com/ergochat/ergo/releases/download/v2.18.0/ergo-2.18.0-macos-x86_64.tar.gz"
      sha256 "69f4682db4a427c41604fb5d3cea64cccce0ae90baa79c6449d39a71e1db8d8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ergochat/ergo/releases/download/v2.18.0/ergo-2.18.0-linux-arm64.tar.gz"
      sha256 "d84188afae05bcbc3d01c18e4d62f0a5a395065b518d86c430ce75cc625fac63"
    end
    on_intel do
      url "https://github.com/ergochat/ergo/releases/download/v2.18.0/ergo-2.18.0-linux-x86_64.tar.gz"
      sha256 "cbd888d9f89224eced6af76dae4b729eaa41ea04afd2e85fe9be8169a790a1da"
    end
  end

  def install
    bin.install "ergo"
    pkgshare.install "default.yaml" if File.exist?("default.yaml")
    pkgshare.install "languages" if File.exist?("languages")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ergo --version")
  end
end
