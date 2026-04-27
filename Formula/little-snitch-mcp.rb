class LittleSnitchMcp < Formula
  desc "MCP server for the Little Snitch macOS firewall"
  homepage "https://github.com/torsday/little-snitch-mcp"
  version "0.0.0"
  license any_of: ["MIT", "Apache-2.0"]

  # NOTE: this formula is a placeholder until little-snitch-mcp v1.0.0 ships.
  # The release workflow at
  #   https://github.com/torsday/little-snitch-mcp/blob/main/.github/workflows/release.yml
  # will open a PR against this file at v1.0.0 tag time, replacing the
  # placeholder URLs and sha256 values with the real artifacts. Until then,
  # `brew install torsday/tap/little-snitch-mcp` will fail to fetch — that's
  # intentional.

  on_macos do
    on_arm do
      url "https://github.com/torsday/little-snitch-mcp/releases/download/v#{version}/little-snitch-mcp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end

    on_intel do
      url "https://github.com/torsday/little-snitch-mcp/releases/download/v#{version}/little-snitch-mcp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  depends_on :macos
  depends_on macos: :sonoma

  def install
    bin.install "little-snitch-mcp"
  end

  def caveats
    <<~EOS
      little-snitch-mcp is a local MCP server. After install, register it with
      your MCP client.

      Claude Code:
        claude mcp add little-snitch #{opt_bin}/little-snitch-mcp

      Claude Desktop — add to
      ~/Library/Application Support/Claude/claude_desktop_config.json:
        {
          "mcpServers": {
            "little-snitch": {
              "command": "#{opt_bin}/little-snitch-mcp"
            }
          }
        }

      Prerequisites: Little Snitch 6.3.3+ with "Allow access via Terminal"
      enabled in Preferences -> Security. Run `little-snitch-mcp doctor` from
      your MCP client to verify.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/little-snitch-mcp --version")
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
