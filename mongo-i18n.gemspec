# encoding: UTF-8
require File.expand_path('../lib/mongo-i18n/version', __FILE__)

Gem::Specification.new do |s|
  s.name         = 'mongo-i18n'
  s.homepage     = 'http://github.com/aulizko/mongo-i18n'
  s.summary      = 'MongoDB backend implementation for I18n gem.'
  s.require_path = 'lib'
  s.authors      = ['Alexander Ulizko']
  s.email        = ['alexander@ulizko.com']
  s.version      = MongoI18n::Version
  s.platform     = Gem::Platform::RUBY
  s.files        = Dir.glob("{lib,spec}/**/*") + %w[LICENSE Rakefile README.rdoc]
  s.description  = 'MongoDB backend implementation for I18n gem.'

  s.add_dependency              'mongo',          '~> 1.1.4'
  s.add_development_dependency  'rspec',          '~> 2.3.0'
end