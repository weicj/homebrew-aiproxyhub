class AiProxyHub < Formula
  desc "Cross-platform local AI proxy hub with CLI and web dashboard"
  homepage "https://github.com/weicj/ai-proxy-hub"
  url "https://github.com/weicj/ai-proxy-hub/releases/download/v0.3.1/ai-proxy-hub-0.3.1.tar.gz"
  sha256 "ce6a6661bd4ac2c4f09c7220bd2dae029957d61ff8c7118937bcd63a2c4004ad"
  license "Apache-2.0"
  depends_on "python@3.11"

  def install
    libexec.install "start.py", "router_server.py", "cli_modern.py", "README.md", "CHANGELOG.md", "CONTRIBUTING.md", "pyproject.toml", "MANIFEST.in", "ai_proxy_hub", "web", "docs", "examples", "LICENSE", "NOTICE"
    (bin/"ai-proxy-hub").write <<~EOS
      #!/bin/bash
      cd "#{libexec}"
      exec "#{Formula["python@3.11"].opt_bin}/python3" -m ai_proxy_hub "$@"
    EOS
  end

  test do
    output = shell_output("#{bin}/ai-proxy-hub --print-paths")
    assert_match "AI Proxy Hub", output
    assert_match "#{libexec}/web", output
  end
end
