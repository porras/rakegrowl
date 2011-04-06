require 'rubygems'
require 'rake'
require 'rakegrowl'
load 'sample.rake'

def run_tasks(*tasks)
  Rake.application.instance_variable_set("@top_level_tasks", tasks)
  silence_stream(STDERR) do
    Rake.application.top_level
  end
end

def clear_tasks
  Rake.application.tasks.each do |task|
    task.instance_variable_set("@already_invoked", false)
  end
end

# taken from ActiveSupport

def silence_stream(stream)
  old_stream = stream.dup
  stream.reopen(RbConfig::CONFIG['host_os'] =~ /mswin|mingw/ ? 'NUL:' : '/dev/null')
  stream.sync = true
  yield
ensure
  stream.reopen(old_stream)
end