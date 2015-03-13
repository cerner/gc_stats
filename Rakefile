#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'rake/clean'

CLEAN.include ['Gemfile.lock', 'coverage']
CLOBBER.include ['pkg']

# See https://relishapp.com/rspec/rspec-core/v/3-2/docs/command-line/rake-task
begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
  task :test => :spec
rescue LoadError
  # no rspec available
end
