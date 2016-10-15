$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cp_oraclecloud/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cp_oraclecloud"
  s.version     = CpOraclecloud::VERSION
  s.authors     = ["Joel Nation"]
  s.email       = ["joel.nation@outlook.com"]
  s.homepage    = "http://github.com/Joelith"
  s.summary     = "Plugin for Cloud_Portal to add support for the Oracle Cloud Platform"
  s.description = "Plugin for Cloud_Portal to add support for the Oracle Cloud Platform"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency "sqlite3"
end
