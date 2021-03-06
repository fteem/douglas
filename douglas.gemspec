# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'douglas/version'

Gem::Specification.new do |spec|
  spec.name          = 'douglas'
  spec.version       = Douglas::VERSION
  spec.authors       = ['Ilija Eftimov']
  spec.email         = ['ileeftimov@gmail.com']

  spec.summary       = 'Douglas adds stamps to any ActiveRecord model'
  spec.description   = 'Douglas adds stamps to any ActiveRecord model, like {created,updated}_by'
  spec.homepage      = 'https://github.com/fteem/douglas'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_runtime_dependency 'activerecord', '>= 4.0.0', '< 5.1'
  spec.add_runtime_dependency 'request_store', '~> 1.3'
end
