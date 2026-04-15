class AiProxyHub < Formula
  include Language::Python::Virtualenv

  desc "Cross-platform local AI proxy hub with CLI and web dashboard"
  homepage "https://github.com/weicj/ai-proxy-hub"
  url "https://github.com/weicj/ai-proxy-hub/releases/download/v0.3.1/ai-proxy-hub-0.3.1.tar.gz"
  sha256 "a66e9b88ec4f2766dcb5713cfff6cd9d8144b9f0e0f69eb562194cfebcf5f4e6"
  license "Apache-2.0"
  depends_on "python"

  resource "rich" do
    url "https://files.pythonhosted.org/packages/ab/3a/0316b28d0761c6734d6bc14e770d85506c986c85ffb239e688eeaab2c2bc/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7ebc4b5c7103ef57baf48d5ea3184f21d9a2befa098"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/aiproxyhub --print-paths")
    assert_match "AI Proxy Hub", output
    assert_match "#{libexec}/web", output
  end
end
