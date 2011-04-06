require "rubygems"
require "rake/gempackagetask"
require "rake/rdoctask"

require "spec"
require "spec/rake/spectask"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = %w(--format specdoc --colour)
  t.libs = ["spec"]
end


task :default => ["spec"]

spec = Gem::Specification.new do |s|

  s.name              = "rakegrowl"
  s.version           = "0.2.0"
  s.summary           = "Get Growled when your long running rake tasks finish"
  s.author            = "Sergio Gil Pérez de la Manga"
  s.email             = "sgilperez@gmail.com"
  s.homepage          = "http://github.com/porras/rakegrowl"

  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.md)
  s.rdoc_options      = %w(--main README.md)

  s.files             = %w(LICENSE README.md) + Dir.glob("{spec,lib/**/*}")
  s.require_paths     = ["lib"]

  s.add_development_dependency("rspec", "~> 1.3.0")

end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec

  # Generate the gemspec file for github.
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

Rake::RDocTask.new do |rd|
  rd.main = "README.md"
  rd.rdoc_files.include("README.md", "lib/**/*.rb")
  rd.rdoc_dir = "rdoc"
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package] do
  rm "#{spec.name}.gemspec"
end
