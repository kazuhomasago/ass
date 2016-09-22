# -*- encoding: utf-8 -*-
# stub: faml 0.8.1 ruby lib
# stub: ext/attribute_builder/extconf.rb

Gem::Specification.new do |s|
  s.name = "faml"
  s.version = "0.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kohei Suzuki"]
  s.date = "2016-02-27"
  s.description = "Faster implementation of Haml template language."
  s.email = ["eagletmt@gmail.com"]
  s.executables = ["faml"]
  s.extensions = ["ext/attribute_builder/extconf.rb"]
  s.files = ["bin/faml", "ext/attribute_builder/extconf.rb"]
  s.homepage = "https://github.com/eagletmt/faml"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Faster implementation of Haml template language."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<escape_utils>, [">= 0"])
      s.add_runtime_dependency(%q<haml_parser>, [">= 0.4.0"])
      s.add_runtime_dependency(%q<parser>, [">= 0"])
      s.add_runtime_dependency(%q<temple>, [">= 0.7.0"])
      s.add_runtime_dependency(%q<tilt>, [">= 0"])
      s.add_development_dependency(%q<appraisal>, [">= 0"])
      s.add_development_dependency(%q<benchmark-ips>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<coffee-script>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<haml>, [">= 4.1.0.beta.1"])
      s.add_development_dependency(%q<hamlit>, [">= 0.6.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rake-compiler>, [">= 0"])
      s.add_development_dependency(%q<redcarpet>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 3.3"])
      s.add_development_dependency(%q<rubocop>, [">= 0.36.0"])
      s.add_development_dependency(%q<sass>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0.9.0"])
      s.add_development_dependency(%q<slim>, [">= 0"])
    else
      s.add_dependency(%q<escape_utils>, [">= 0"])
      s.add_dependency(%q<haml_parser>, [">= 0.4.0"])
      s.add_dependency(%q<parser>, [">= 0"])
      s.add_dependency(%q<temple>, [">= 0.7.0"])
      s.add_dependency(%q<tilt>, [">= 0"])
      s.add_dependency(%q<appraisal>, [">= 0"])
      s.add_dependency(%q<benchmark-ips>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<coffee-script>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<haml>, [">= 4.1.0.beta.1"])
      s.add_dependency(%q<hamlit>, [">= 0.6.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rake-compiler>, [">= 0"])
      s.add_dependency(%q<redcarpet>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 3.3"])
      s.add_dependency(%q<rubocop>, [">= 0.36.0"])
      s.add_dependency(%q<sass>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0.9.0"])
      s.add_dependency(%q<slim>, [">= 0"])
    end
  else
    s.add_dependency(%q<escape_utils>, [">= 0"])
    s.add_dependency(%q<haml_parser>, [">= 0.4.0"])
    s.add_dependency(%q<parser>, [">= 0"])
    s.add_dependency(%q<temple>, [">= 0.7.0"])
    s.add_dependency(%q<tilt>, [">= 0"])
    s.add_dependency(%q<appraisal>, [">= 0"])
    s.add_dependency(%q<benchmark-ips>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<coffee-script>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<haml>, [">= 4.1.0.beta.1"])
    s.add_dependency(%q<hamlit>, [">= 0.6.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rake-compiler>, [">= 0"])
    s.add_dependency(%q<redcarpet>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 3.3"])
    s.add_dependency(%q<rubocop>, [">= 0.36.0"])
    s.add_dependency(%q<sass>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0.9.0"])
    s.add_dependency(%q<slim>, [">= 0"])
  end
end
