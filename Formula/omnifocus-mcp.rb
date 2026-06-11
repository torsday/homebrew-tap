class OmnifocusMcp < Formula
  desc "MCP server exposing the full OmniFocus surface to LLM agents"
  homepage "https://github.com/torsday/omnifocus-mcp"
  url "https://registry.npmjs.org/@torsday/omnifocus-mcp/-/omnifocus-mcp-2.0.2.tgz"
  sha256 "163f6100bbb4bdb8d021cd1ba140445685460f97e74dd5eb1d6786870e5853b4"
  license "MIT"
  version "2.0.2"

  depends_on "node"
  depends_on :macos

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      omnifocus-mcp is a local MCP server. After install, register it with
      your MCP client.

      Claude Code:
        claude mcp add omnifocus #{opt_bin}/omnifocus-mcp

      Claude Desktop — add to
      ~/Library/Application Support/Claude/claude_desktop_config.json:
        {
          "mcpServers": {
            "omnifocus": {
              "command": "#{opt_bin}/omnifocus-mcp"
            }
          }
        }

      OpenCode — add to ~/.config/opencode/opencode.json:
        {
          "mcp": {
            "omnifocus": {
              "type": "local",
              "command": ["#{opt_bin}/omnifocus-mcp"],
              "enabled": true
            }
          }
        }

      On first use, macOS will prompt for Automation permission:
        System Settings → Privacy & Security → Automation → [your terminal] → OmniFocus
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omnifocus-mcp --version")
  end

  livecheck do
    url "https://registry.npmjs.org/@torsday/omnifocus-mcp/latest"
    regex(/"version"\s*:\s*"([^"]+)"/i)
    strategy :json do |json|
      json["version"]
    end
  end
end
