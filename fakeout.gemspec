# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fakeout/version"

Gem::Specification.new do |s|
  s.name          = "fakeout"
  s.version       = Fakeout::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Matte Noble"]
  s.email         = ["me@mattenoble.com"]
  s.homepage      = "http://github.com/mnoble/fakeout"
  s.summary       = %q{Fakeout captures STDOUT and STDERR for command line testing.}
  s.description   = %q{Fakeout captures STDOUT and STDERR for command line testing.}
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rspec", ">= 2.5.0"
end
