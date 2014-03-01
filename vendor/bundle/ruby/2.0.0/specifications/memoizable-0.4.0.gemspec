# -*- encoding: utf-8 -*-
# stub: memoizable 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "memoizable"
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dan Kubb", "Erik Michaels-Ober"]
  s.date = "2013-12-24"
  s.description = "Memoize method return values"
  s.email = ["dan.kubb@gmail.com", "sferik@gmail.com"]
  s.extra_rdoc_files = ["CONTRIBUTING.md", "LICENSE.md", "README.md"]
  s.files = ["CONTRIBUTING.md", "LICENSE.md", "README.md"]
  s.homepage = "https://github.com/dkubb/memoizable"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Memoize method return values"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thread_safe>, ["~> 0.1.3"])
      s.add_development_dependency(%q<bundler>, [">= 1.3.5", "~> 1.3"])
    else
      s.add_dependency(%q<thread_safe>, ["~> 0.1.3"])
      s.add_dependency(%q<bundler>, [">= 1.3.5", "~> 1.3"])
    end
  else
    s.add_dependency(%q<thread_safe>, ["~> 0.1.3"])
    s.add_dependency(%q<bundler>, [">= 1.3.5", "~> 1.3"])
  end
end
