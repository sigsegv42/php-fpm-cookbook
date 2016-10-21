begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end

begin
  require 'stove/rake_task'
  Stove::RakeTask.new
rescue LoadError
  puts '>>>>> Stove gem not loaded, omitting tasks' unless ENV['CI']
end

require 'foodcritic'
FoodCritic::Rake::LintTask.new do |t|
  t.options = { fail_tags: ['any'] }
end

require 'cookstyle'
require 'rubocop/rake_task'
RuboCop::RakeTask.new do |task|
  task.options << '--display-cop-names'
end
