require 'spec_helper'

describe Growl do
  
  describe "exists?" do
    
    it "should return true if growlnotify is installed in the system" do
      Growl.stub!(:`).with("which growlnotify").and_return("/wadus/bin/growlnotify\n")
      Growl.exists?.should be_true
    end
    
    it "should return false if growlnotify is not installed in the system" do
      Growl.stub!(:`).with("which growlnotify").and_return("\n")
      Growl.exists?.should be_false
    end
    
  end
  
  describe "notify" do
    
    it "should call growlnotify with title and message" do
      Growl.stub!(:`).with("which growlnotify").and_return("/wadus/bin/growlnotify\n")
      Kernel.should_receive(:system).with("/wadus/bin/growlnotify -t \"wadus\" -m \"wadus wadus\"").once
      Growl.notify("wadus", "wadus wadus")
    end
    
    it "should not call anything if growlnotify is not installed in the system" do
      Growl.stub!(:`).with("which growlnotify").and_return("\n")
      Kernel.should_not_receive(:system)
      Growl.notify("wadus", "wadus wadus")
    end
    
  end
  
end

describe "rakegrowl" do
  
  before(:each) do
    Growl.stub!(:notify)
    clear_tasks
  end
  
  it "should notify when the main task ends" do
    Growl.should_receive(:notify).with("Rake", "Task main finished").once
    run_tasks "main"
  end
  
  it "should not notify when a dependency task ends" do
    Growl.should_not_receive(:notify).with("Rake", "Task pre finished")
    run_tasks "main"    
  end
  
  it "should notify when each main task ends" do
    Growl.should_receive(:notify).with("Rake", "Task main finished").once
    Growl.should_receive(:notify).with("Rake", "Task main2 finished").once
    run_tasks "main", "main2"
  end
  
  it "should notify when a task fails" do
    pending "Test written but not implemented still"
    Growl.should_receive(:notify).with("Rake", "Task buggy failed")
    run_tasks "buggy"
  end
  
  it "should work with namespaced tasks" do
    Growl.should_not_receive(:notify).with("Rake", "Task wadus:wadus finished").once
    run_tasks "wadus:wadus"
  end
  
end