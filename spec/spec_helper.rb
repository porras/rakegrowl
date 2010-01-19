require 'rubygems'
require 'rake'
load 'sample.rake'
require 'growl'
require 'rakegrowl'

def run_tasks(*tasks)
  Rake.application.instance_variable_set("@top_level_tasks", tasks)
  Rake.application.top_level
end

def clear_tasks
  Rake.application.tasks.each do |task|
    task.instance_variable_set("@already_invoked", false)
  end
end