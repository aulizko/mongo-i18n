require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
require File.expand_path('../lib/mongo-i18n/version', __FILE__)

namespace :spec do
  RSpec::Core::RakeTask.new(:all) do |t|
    t.rspec_opts = %w[--color]
    t.verbose = true
  end
end

task :default => :'spec:all'

desc 'Builds the gem'
task :build do
  sh "gem build mongo-i18n.gemspec"
end

desc 'Builds and installs the gem'
task :install => :build do
  sh "gem install mongo-i18n-#{MongoI18n::Version}"
end

desc 'Tags version, pushes to remote, and pushes gem'
task :release => :build do
  sh "git tag v#{MongoI18n::Version}"
  sh "git push origin master"
  sh "git push origin v#{MongoI18n::Version}"
  sh "gem push mongo-i18n-#{MongoI18n::Version}.gem"
end
