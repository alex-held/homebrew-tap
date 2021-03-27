require "language/node"

class Readme < Formula
  desc "generates readme's"
  homepage "https://github.com/kefranabg/readme-md-generator"
  url "https://registry.npmjs.org/readme-md-generator/-/readme-md-generator-1.0.0.tgz"
  sha256 "68b4a08aa022f521fc7d21a1effad6c780fe48c6cf895d64e65bdacb5f72c570"
  license "MIT"

  depends_on "node"
  
  livecheck do
    url :stable
  end


  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "OK", shell_output("readme --version").strip
  end

end
