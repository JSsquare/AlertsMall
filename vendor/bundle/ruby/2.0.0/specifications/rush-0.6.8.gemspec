# -*- encoding: utf-8 -*-
# stub: rush 0.6.8 ruby lib

Gem::Specification.new do |s|
  s.name = "rush"
  s.version = "0.6.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Adam Wiggins"]
  s.date = "2010-01-29"
  s.description = "A Ruby replacement for bash+ssh, providing both an interactive shell and a library.  Manage both local and remote unix systems from a single client."
  s.email = "adam@heroku.com"
  s.executables = ["rush", "rushd"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "bin/rush", "bin/rushd"]
  s.homepage = "http://rush.heroku.com/"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubyforge_project = "ruby-shell"
  s.rubygems_version = "2.2.2"
  s.summary = "A Ruby replacement for bash+ssh."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0.9.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.8.3"])
      s.add_development_dependency(%q<rspec>, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<session>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0.9.0"])
      s.add_dependency(%q<jeweler>, [">= 1.8.3"])
      s.add_dependency(%q<rspec>, ["~> 1.2.0"])
      s.add_dependency(%q<session>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.9.0"])
    s.add_dependency(%q<jeweler>, [">= 1.8.3"])
    s.add_dependency(%q<rspec>, ["~> 1.2.0"])
    s.add_dependency(%q<session>, [">= 0"])
  end
end
