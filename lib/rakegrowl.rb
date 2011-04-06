module Rakegrowl
  
  module Growl
    def self.growlnotify
      `which growlnotify`.chomp
    end

    def self.exists?
      !growlnotify.empty?
    end

    def self.notify(title, message)
      Kernel.system("#{growlnotify} -t \"#{title}\" -m \"#{message}\"") if exists?
    end
  end
  
  def self.enhance_tasks
    if Growl.exists?
      Rake::Task.tasks.each do |task|
        task.enhance do
          Growl.notify "Rake", "Task #{task.name} finished" if Rake.application.top_level_tasks.include?(task.name)
        end
      end
    end
  end
  
end

Rake::Application.class_eval do
  def top_level_with_growl
    Rakegrowl.enhance_tasks
    begin
      top_level_without_growl
    rescue SystemExit
      Rakegrowl::Growl.notify "Rake", "Task failed!"
      raise
    end
  end
  alias_method :top_level_without_growl, :top_level
  alias_method :top_level, :top_level_with_growl
end
