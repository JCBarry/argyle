$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "argyle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "argyle"
  s.version     = Argyle::VERSION
  s.authors     = ["Jason Barry"]
  s.email       = ["jay@jcbarry.com"]
  s.homepage    = "https://github.com/JCBarry/argyle"
  s.summary     = "Rails helpers for Plaid Link"
  s.description = "Easily integrate Plaid Link into your Rails application"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
end
