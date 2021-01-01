# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/webpage_view_counter/version'

Gem::Specification.new do |spec|
  spec.name          = 'webpage_view_counter'
  spec.version       = WebpageViewCounter::VERSION
  spec.authors       = ['Jamal Afridi']
  spec.email         = ['jamalafridi96@gmail.com']
  spec.summary       = 'Smart Pensions kata'
  spec.license       = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
