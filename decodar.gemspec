$:.push File.expand_path("../lib", __FILE__)
# Maintain your gem's version:
require "decodar/version"

Gem::Specification.new do |s|
   s.name = "decodar"
   s.summary = "A CODA Wrapper Library"
   s.description = "A Coded statement of account (CODA) Wrapper Library"
   s.version = Decodar::VERSION
   s.authors = "Thibault Poncelet"
   s.email = "thibaultponcelet@gmail.com"
   s.platform = Gem::Platform::RUBY
   s.required_ruby_version = '>=1.9.2'
   s.files = Dir["{lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
   s.has_rdoc = true
   s.test_files  = Dir.glob("spec/**/*.rb")
   s.homepage    = "https://github.com/thibaultponcelet/decodar"
   s.add_development_dependency 'rspec', '~> 2.11.0'
end
