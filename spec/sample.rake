task :pre do
  "do pre"
end

task :main => :pre do
  "do main"
end

task :main2 => :pre do
  "do main2"
end

task :buggy do
  raise "Wadus"
end

namespace :wadus do
  task :wadus do
    "do wadus wadus"
  end
end
