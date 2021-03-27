require 'lib'

class CodeSandbox < NodeFormulaBase
  
  def initialize(name, path, spec, alias_path: nil, force_bottle: nil)
    super
    @version = "2.2.1"

  end

  def CodeSandbox.new
    self.init("online ide",
              "https://github.com/codesandbox/codesandbox-importers/tree/master/packages/cli",
              "https://registry.npmjs.org/codesandbox/-/codesandbox-2.2.1.tgz",
              "codesandbox", 
              "ed393ef833c69d2521fe3a61e02123b4d012f01899127f5f716fa0f188ec6347"
    )
  end
end
