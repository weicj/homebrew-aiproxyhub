class AiProxyHub < Formula
  desc "Cross-platform local AI proxy hub with CLI and web dashboard"
  homepage "https://github.com/weicj/ai-proxy-hub"
  url "https://github.com/weicj/ai-proxy-hub/releases/download/v0.3.1/ai-proxy-hub-0.3.1.tar.gz"
  sha256 "6f7b9ee8363ff33951bd027bfa98035bca215d43f7bfb6b92e92a6b253dfeef5"
  license "Apache-2.0"
  depends_on "python"

  def install
    libexec.install "aiproxyhub.py", "start.py", "router_server.py", "cli_modern.py", "README.md", "CHANGELOG.md", "CONTRIBUTING.md", "pyproject.toml", "MANIFEST.in", "ai_proxy_hub", "web", "docs", "examples", "LICENSE", "NOTICE"
    (bin/"ai-proxy-hub").write <<~EOS
      #!/bin/bash
      cd "#{libexec}"
      exec "#{Formula["python"].opt_bin}/python3" -m ai_proxy_hub "$@"
    EOS
    (bin/"aiproxyhub").write <<~EOS
      #!/bin/bash
      cd "#{libexec}"
      exec "#{Formula["python"].opt_bin}/python3" -m ai_proxy_hub "$@"
    EOS
  end

  test do
    output = shell_output("#{bin}/aiproxyhub --print-paths")
    assert_match "AI Proxy Hub", output
    assert_match "#{libexec}/web", output
  end
end
