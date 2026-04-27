# torsday/homebrew-tap

Homebrew formulas for tools maintained by [@torsday](https://github.com/torsday).

## Usage

```bash
brew tap torsday/tap
brew install <formula>
```

…or in one line:

```bash
brew install torsday/tap/<formula>
```

## Available formulas

| Formula | Description |
|---------|-------------|
| [`little-snitch-mcp`](./Formula/little-snitch-mcp.rb) | MCP server for the Little Snitch macOS firewall |

## How formulas land here

Most formulas in this tap are bumped automatically by their source repo's release workflow via [`mislav/bump-homebrew-formula-action`](https://github.com/mislav/bump-homebrew-formula-action). When a new release is tagged upstream, that workflow opens a PR here updating the version and `sha256`. Merging that PR ships the new version to anyone running `brew upgrade`.

## Verifying release artifacts

Every binary distributed via this tap is downloaded from a GitHub Release on the source repo. Those releases include:

- A Sigstore-signed [build provenance attestation](https://docs.github.com/en/actions/security-guides/using-artifact-attestations) tying each binary to the GitHub Actions run that built it.
- An Apple Developer ID code signature with a stapled notarization ticket.
- A `SHA256SUMS` file you can verify with `shasum -a 256 -c`.

See each project's README for the full verification recipe.
