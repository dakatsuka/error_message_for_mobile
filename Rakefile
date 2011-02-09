require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the error_message_for_mobile plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the error_message_for_mobile plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ErrorMessageForMobile'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "error_message_for_mobile"
    gemspec.summary = "error_message_on for japanese mobile-phone"
    gemspec.email = "d.akatsuka@gmail.com"
    gemspec.homepage = "https://github.com/dakatsuka/error_message_for_mobile"
    gemspec.description = "error_message_on for japanese mobile-phone"
    gemspec.authors = ["Dai Akatsuka"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
