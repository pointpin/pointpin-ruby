# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pointpin/version'

Gem::Specification.new do |spec|
  spec.name          = "pointpin"
  spec.version       = Pointpin::VERSION
  spec.authors       = ["Brian Flanagan"]
  spec.email         = ["brian@coralmade.com"]
  spec.homepage      = "https://github.com/pointpin/pointpin-ruby"
  spec.summary       = %q{Pointp.in API wrapper in Ruby}
  spec.description   = %q{Pointp.in API wrapper in Ruby}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('vcr')
  spec.add_development_dependency('typhoeus')

  spec.add_dependency('faraday')
  spec.add_dependency('multi_json')
  spec.add_dependency('hashie')
end
