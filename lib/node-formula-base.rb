# typed: true
# frozen_string_literal: true


require "language/node"


class NodeFormulaBase < Formula


  depends_on "node"
  
  @public
  def init(pkg = "", version = "", desc = "", github = "",  sha = "")
    @name = pkg
    @version = version
    @homepage = github
    
    m = github.match /github.com\/(?<user>.*)\/(?<repo>.*)/
    github_user = m[:user]
    repo = m[:repo]
    @url = "https://registry.npmjs.org/#{github_user}/-/'#{pkg}'-#{version}.tgz"
    @desc = desc
    @sha256 = sha
  end
  
  def configure
    @command = *Language::Node.std_npm_install_args(libexec)
    if debug? == true
      print "description:         #{@desc}"
      print "pkg-name:            #{@name}"
      print "cmd:                 #{@command}"
      print "pkg-url:             #{@url}"
      print "pkg-sha:             #{@sha256}"
      print "pkg-homepage:        #{@homepage}"
    end
  end
  

  def install
    system "npm", "install", @command
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "OK", shell_output("#{@command} --version").strip
  end

end
