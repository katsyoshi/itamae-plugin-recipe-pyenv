# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/recipe/pyenv/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-pyenv"
  spec.version       = Itamae::Plugin::Recipe::Pyenv::VERSION
  spec.authors       = ["MATSUMOTO, Katsuyoshi"]
  spec.email         = ["github@katsyoshi.org"]

  spec.summary       = %q{itamae plugin recipe pyenv}
  spec.description   = %q{itamae plugin recipe pyenv}
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/katsyoshi/itamae-plugin-recipe-pyenv"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "itamae", "~> 1.2"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
end
