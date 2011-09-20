# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rakegrowl"
  s.version = "0.3.0"

  s.authors = ["Sergio Gil Pérez de la Manga"]
  s.date = "2011-05-11"
  s.email = "sgilperez@gmail.com"
  s.extra_rdoc_files = ["README.md"]
  s.files = %w(LICENSE README.md) + Dir.glob("{spec,lib/**/*}")
  s.homepage = "http://github.com/porras/rakegrowl"
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.summary = s.description = "Get Growled when your long running rake tasks finish"
end
