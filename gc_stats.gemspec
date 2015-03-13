$:.push File.expand_path('../lib', __FILE__)

require 'gc_stats/version'

Gem::Specification.new do |gem|
  gem.name = 'gc_stats'
  gem.version = GCStats::VERSION
  gem.license = 'Apache-2.0'
  gem.authors = ['Faiz Ahmed Shaik', 'Kevin Shekleton']
  gem.summary = 'Collects and logs garbage collection statistics for Rails applications.'
  gem.homepage = 'https://github.com/cerner/gc_stats'
  gem.required_ruby_version = '>= 2.1.0'
  gem.description = <<-EOS
    gc_stats is a Ruby gem for Rails applications that collects and logs garbage collection statistics
    during each request. GC statistics are only logged if a GC event is detected. This allows you to
    track and analyze the GC characteristics of your Rails application.
  EOS

  gem.files = Dir['lib/**/*.rb', 'CHANGELOG.md', 'CONTRIBUTORS.md', 'LICENSE.txt', 'NOTICE.txt', 'README.md']
end
