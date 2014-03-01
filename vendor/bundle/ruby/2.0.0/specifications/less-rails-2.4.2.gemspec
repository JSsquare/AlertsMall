# -*- encoding: utf-8 -*-
# stub: less-rails 2.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "less-rails"
  s.version = "2.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ken Collins"]
  s.date = "2013-09-07"
  s.description = "The dynamic stylesheet language for the Rails asset pipeline. Allows other gems to extend Less load path."
  s.email = ["ken@metaskills.net"]
  s.homepage = "http://github.com/metaskills/less-rails"
  s.rubygems_version = "2.2.2"
  s.summary = "The dynamic stylesheet language for the Rails asset pipeline."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<less>, ["~> 2.4.0"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3.1"])
      s.add_development_dependency(%q<appraisal>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<guard-minitest>, [">= 0"])
      s.add_development_dependency(%q<rails>, [">= 0"])
    else
      s.add_dependency(%q<less>, ["~> 2.4.0"])
      s.add_dependency(%q<actionpack>, [">= 3.1"])
      s.add_dependency(%q<appraisal>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<guard-minitest>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 0"])
    end
  else
    s.add_dependency(%q<less>, ["~> 2.4.0"])
    s.add_dependency(%q<actionpack>, [">= 3.1"])
    s.add_dependency(%q<appraisal>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<guard-minitest>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 0"])
  end
end
