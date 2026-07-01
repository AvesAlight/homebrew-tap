class Roost < Formula
  desc "IRC-based multi-agent coordination for Claude Code"
  homepage "https://github.com/AvesAlight/roost"
  url "https://github.com/AvesAlight/roost/archive/refs/tags/v0.8.6.tar.gz"
  sha256 "267d41febd178b7e76a5e1e3210ec5607cb2f7e3d72873473c7d0cbf2744ccc9"
  license "Apache-2.0"
  head "https://github.com/AvesAlight/roost.git", branch: "main"

  depends_on "oven-sh/bun/bun"
  depends_on "tmux"
  depends_on "AvesAlight/tap/ergo"

  def install
    # Install entire plugin tree under libexec; bin/roost relies on a
    # plugin-rooted layout (bin/, src/, prompts/, .claude-plugin/ siblings).
    # Include dotfiles — .claude-plugin/plugin.json and .mcp.json are required
    # for Claude Code to load the plugin.
    libexec.install Dir["*", ".[!.]*"]

    # Install bun deps inside libexec so the MCP server can `import` them
    # at runtime. Done at install-time, not test-time.
    cd libexec do
      system "bun", "install", "--frozen-lockfile"
    end

    bin.install_symlink libexec/"bin/roost"
  end

  def caveats
    <<~EOS
      roost requires Claude Code (the CLI). Install separately:
        npm install -g @anthropic-ai/claude-code

      In a project, bootstrap with:
        roost init

      ergo IRC server is installed alongside; start it with:
        ergo run --conf <path-to-config>
    EOS
  end

  test do
    assert_match "Usage: roost", shell_output("#{bin}/roost 2>&1", 2)
  end
end
