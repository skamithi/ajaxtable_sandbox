$:.unshift(RAILS_ROOT + '/vendor/plugins/cucumber/lib')
require 'cucumber/rake/task'

namespace :cucumber do
  Cucumber::Rake::Task.new(:plain) do |t|
    t.cucumber_opts = "--format pretty"
    t.step_list = %w{features/support/env.rb features/support/plain.rb}
    t.step_pattern = "features/**/step_definitions/*.rb"
  end
  task :plain => 'db:test:prepare'

  Cucumber::Rake::Task.new(:selenium, "Run features with Cucumber+Selenium from features/selenium, inside browsers") do |t|
    t.cucumber_opts = "--format pretty"
    t.step_list = %w{features/support/env.rb features/support/selenium.rb}
    t.step_pattern = "features/**/step_definitions/*.rb"
    t.feature_pattern = "features/**/*.ajaxy.features"
  end
  task :selenium => 'db:test:prepare'
end

desc "shortcut for cucumber:plain"
task :features => 'cucumber:plain'

desc "shortcut for cucumber:selenium"
task :selenium => 'cucumber:selenium'
