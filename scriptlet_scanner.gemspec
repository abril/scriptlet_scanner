# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "scriptlet_scanner"
require "step-up"

gf = File.expand_path("../GEM_VERSION", __FILE__)
File.delete(gf) if File.exists?(gf)

Gem::Specification.new do |s|
  s.name          = "scriptlet_scanner"
  s.version       = ScriptletScanner::VERSION.to_s
  s.platform      = Gem::Platform::RUBY
  s.summary       = "A great template parser that helps you to capture and inspect server-side scripts"
  s.require_paths = ['lib']
  s.files         = Dir["{lib/**/*.rb,lib/**/*.treetop,GEM_VERSION,README.md}"]

  s.authors       = ["Marcelo Manzan", "Leonardo Campos"]
  s.email         = ["manzan@gmail.com", "leonardoaugusto.campos@gmail.com"]
  s.homepage      = "http://github.com/abril"

  # s.add_dependency('dependency', '>= 1.0.0')

  # s.add_development_dependency('cover_me')
  # s.add_development_dependency('ruby-debug19')
  s.add_development_dependency('step-up', '~> 0.6.0')
end
