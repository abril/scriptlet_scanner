ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |t|
end

desc 'Load the gem environment'
task :environment do
  require File.expand_path(File.dirname(__FILE__) + '/lib/scriptlet_scanner.rb')
end

desc "Build the gem"
task :build do
  gem_name = 'scriptlet_scanner'
  opers = Dir.glob('*.gem')
  opers = ["rm #{ opers.join(' ') }"] unless opers.empty?
  opers << ["gem build #{gem_name}.gemspec"]
  sh opers.join(" && ")
end

desc "Build and install the gem, removing old installation"
task :install => :build do
  gem_file = Dir.glob('*.gem').first
  gem_name = 'scriptlet_scanner'
  if gem_file.nil?
    puts "could not install the gem"
  else
    sh "gem uninstall --ignore-dependencies --executables #{gem_name}; gem install #{ gem_file }"
  end
end

# To load rake tasks on lib/task folder
# load 'lib/tasks/task_sample.rake'

task :default => :spec
