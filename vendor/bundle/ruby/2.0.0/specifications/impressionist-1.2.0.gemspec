# -*- encoding: utf-8 -*-
# stub: impressionist 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "impressionist"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["johnmcaliley"]
  s.date = "2013-02-19"
  s.description = "Log impressions from controller actions or from a model"
  s.email = "john.mcaliley@gmail.com"
  s.homepage = "https://github.com/charlotte-ruby/impressionist"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Easy way to log impressions"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httpclient>, ["~> 2.2"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0.9"])
      s.add_development_dependency(%q<rails>, ["~> 3.1"])
      s.add_development_dependency(%q<rdoc>, [">= 2.4.2"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<systemu>, [">= 0"])
    else
      s.add_dependency(%q<httpclient>, ["~> 2.2"])
      s.add_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0.9"])
      s.add_dependency(%q<rails>, ["~> 3.1"])
      s.add_dependency(%q<rdoc>, [">= 2.4.2"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<systemu>, [">= 0"])
    end
  else
    s.add_dependency(%q<httpclient>, ["~> 2.2"])
    s.add_dependency(%q<nokogiri>, ["~> 1.5"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0.9"])
    s.add_dependency(%q<rails>, ["~> 3.1"])
    s.add_dependency(%q<rdoc>, [">= 2.4.2"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<systemu>, [">= 0"])
  end
end
