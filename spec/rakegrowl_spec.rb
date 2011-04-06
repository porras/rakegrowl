require 'spec_helper'

describe Rakegrowl::Growl do
  
  describe "exists?" do
    
    it "should return true if growlnotify is installed in the system" do
      Rakegrowl::Growl.stub!(:`).with("which growlnotify").and_return("/wadus/bin/growlnotify\n")
      Rakegrowl::Growl.exists?.should be_true
    end
    
    it "should return false if growlnotify is not installed in the system" do
      Rakegrowl::Growl.stub!(:`).with("which growlnotify").and_return("\n")
      Rakegrowl::Growl.exists?.should be_false
    end
    
  end
  
  describe "notify" do
    
    it "should call growlnotify with title and message" do
      Rakegrowl::Growl.stub!(:`).with("which growlnotify").and_return("/wadus/bin/growlnotify\n")
      Kernel.should_receive(:system).with("/wadus/bin/growlnotify -t \"wadus\" -m \"wadus wadus\"").once
      Rakegrowl::Growl.notify("wadus", "wadus wadus")
    end
    
    it "should not call anything if growlnotify is not installed in the system" do
      Rakegrowl::Growl.stub!(:`).with("which growlnotify").and_return("\n")
      Kernel.should_not_receive(:system)
      Rakegrowl::Growl.notify("wadus", "wadus wadus")
    end
    
  end
  
end

describe "rakegrowl" do
  
  before(:each) do
    Rakegrowl::Growl.stub!(:notify => true, :exists? => true)
    clear_tasks
  end
  
  it "should notify when the main task ends" do
    Rakegrowl::Growl.should_receive(:notify).with("Rake", "Task main finished").once
    run_tasks "main"
  end
  
  it "should not notify when a dependency task ends" do
    Rakegrowl::Growl.should_not_receive(:notify).with("Rake", "Task pre finished")
    run_tasks "main"    
  end
  
  it "should notify when each main task ends" do
    Rakegrowl::Growl.should_receive(:notify).with("Rake", "Task main finished").once
    Rakegrowl::Growl.should_receive(:notify).with("Rake", "Task main2 finished").once
    run_tasks "main", "main2"
  end
  
  it "should notify when a task fails" do
    Rakegrowl::Growl.should_receive(:notify).with("Rake", "Task failed!")
    lambda { run_tasks "buggy" }.should raise_error(SystemExit)
  end
  
  it "should work with namespaced tasks" do
    Rakegrowl::Growl.should_not_receive(:notify).with("Rake", "Task wadus:wadus finished").once
    run_tasks "wadus:wadus"
  end
  
end