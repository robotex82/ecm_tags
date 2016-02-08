$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/tags/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_tags"
  s.version     = Ecm::Tags::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_tags"
  s.summary     = "Easy tagging for itsf backend"
  s.description = "ECM Tags Module"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
end
