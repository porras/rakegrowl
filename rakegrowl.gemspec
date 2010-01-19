# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rakegrowl}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sergio Gil P\303\251rez de la Manga"]
  s.date = %q{2010-01-25}
  s.email = %q{sgilperez@gmail.com}
  s.extra_rdoc_files = ["README.md"]
  s.files = ["LICENSE", "README.md", "spec", "lib/rakegrowl.rb"]
  s.homepage = %q{http://github.com/porras/rakegrowl}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Get Growled when your long running rake tasks finish}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
