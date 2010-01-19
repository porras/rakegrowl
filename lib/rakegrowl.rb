if Growl.exists?
  Rake::Task.tasks.each do |task|
    task.enhance do
      Growl.notify "Rake", "Task #{task.name} finished" if Rake.application.top_level_tasks.include?(task.name)
    end
  end
end