require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

require "rake/testtask"
Rake::TestTask.new("test") do |t|
  t.pattern = 'test/*_test.rb'
  t.verbose = true
  t.warning = true
end

task :default => [:spec, :test]