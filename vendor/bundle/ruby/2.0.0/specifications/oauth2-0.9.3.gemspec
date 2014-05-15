# -*- encoding: utf-8 -*-
# stub: oauth2 0.9.3 ruby lib

Gem::Specification.new do |s|
  s.name = "oauth2"
  s.version = "0.9.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michael Bleigh", "Erik Michaels-Ober"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDLjCCAhagAwIBAgIBADANBgkqhkiG9w0BAQUFADA9MQ8wDQYDVQQDDAZzZmVy\naWsxFTATBgoJkiaJk/IsZAEZFgVnbWFpbDETMBEGCgmSJomT8ixkARkWA2NvbTAe\nFw0xMzAyMDMxMDAyMjdaFw0xNDAyMDMxMDAyMjdaMD0xDzANBgNVBAMMBnNmZXJp\nazEVMBMGCgmSJomT8ixkARkWBWdtYWlsMRMwEQYKCZImiZPyLGQBGRYDY29tMIIB\nIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAl0x5dx8uKxi7TkrIuyBUTJVB\nv1o93nUB9j/y4M96gV2rYwAci1JPBseNd6Fybzjo3YGuHl7EQHuSHNaf1p2lxew/\ny60JXIJBBgPcDK/KCP4NUHofm0jfoYD+H5uNJfHCNq7/ZsTxOtE3Ra92s0BCMTpm\nwBMMlWR5MtdEhIYuBO4XhnejYgH0L/7BL2lymntVnsr/agdQoojQCN1IQmsRJvrR\nduZRO3tZvoIo1pBc4JEehDuqCeyBgPLOqMoKtQlold1TQs1kWUBK7KWMFEhKC/Kg\nzyzKRHQo9yDYwOvYngoBLY+T/lwCT4dyssdhzRbfnxAhaKu4SAssIwaC01yVowID\nAQABozkwNzAJBgNVHRMEAjAAMB0GA1UdDgQWBBS0ruDfRak5ci1OpDNX/ZdDEkIs\niTALBgNVHQ8EBAMCBLAwDQYJKoZIhvcNAQEFBQADggEBAHHSMs/MP0sOaLkEv4Jo\nzvkm3qn5A6t0vaHx774cmejyMU+5wySxRezspL7ULh9NeuK2OhU+Oe3TpqrAg5TK\nR8GQILnVu2FemGA6sAkPDlcPtgA6ieI19PZOF6HVLmc/ID/dP/NgZWWzEeqQKmcK\n2+HM+SEEDhZkScYekw4ZOe164ZtZG816oAv5x0pGitSIkumUp7V8iEZ/6ehr7Y9e\nXOg4eeun5L/JjmjARoW2kNdvkRD3c2EeSLqWvQRsBlypHfhs6JJuLlyZPGhU3R/v\nSf3lVKpBCWgRpGTvy45XVpB+59y33PJmEuQ1PTEOYvQyao9UKMAAaAN/7qWQtjl0\nhlw=\n-----END CERTIFICATE-----\n"]
  s.date = "2014-01-16"
  s.description = "A Ruby wrapper for the OAuth 2.0 protocol built with a similar style to the original OAuth spec."
  s.email = ["michael@intridea.com", "sferik@gmail.com"]
  s.homepage = "http://github.com/intridea/oauth2"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "A Ruby wrapper for the OAuth 2.0 protocol."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_runtime_dependency(%q<faraday>, ["< 0.10", ">= 0.8"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.3"])
      s.add_runtime_dependency(%q<multi_xml>, ["~> 0.5"])
      s.add_runtime_dependency(%q<rack>, ["~> 1.2"])
      s.add_runtime_dependency(%q<jwt>, ["~> 0.1.8"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<faraday>, ["< 0.10", ">= 0.8"])
      s.add_dependency(%q<multi_json>, ["~> 1.3"])
      s.add_dependency(%q<multi_xml>, ["~> 0.5"])
      s.add_dependency(%q<rack>, ["~> 1.2"])
      s.add_dependency(%q<jwt>, ["~> 0.1.8"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<faraday>, ["< 0.10", ">= 0.8"])
    s.add_dependency(%q<multi_json>, ["~> 1.3"])
    s.add_dependency(%q<multi_xml>, ["~> 0.5"])
    s.add_dependency(%q<rack>, ["~> 1.2"])
    s.add_dependency(%q<jwt>, ["~> 0.1.8"])
  end
end
