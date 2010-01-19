module Growl
  
  class << self
    
    def growlnotify
      `which growlnotify`.chomp
    end
    
    def exists?
      !growlnotify.empty?
    end
    
    def notify(title, message)
      Kernel.system("#{growlnotify} -t \"#{title}\" -m \"#{message}\"") if exists?
    end
    
  end
  
end