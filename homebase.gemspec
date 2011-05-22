# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{homebase}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeremy Witmer"]
  s.date = %q{2011-05-21}
  s.default_executable = %q{homebase}
  s.description = %q{Homebase provides the ability to store, retrieve, and delete files in the user's home directory. Everything's stored in a hidden folder titled <.appname>.}
  s.email = %q{jtwitmer@gmail.com}
  s.executables = ["homebase"]
  s.extra_rdoc_files = ["History.txt", "bin/homebase"]
  s.files = ["History.txt", "README.md", "Rakefile", "bin/homebase", "lib/homebase.rb", "lib/homebase/main.rb", "spec/homebase_spec.rb", "spec/spec_helper.rb", "version.txt"]
  s.homepage = %q{git}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{homebase}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Homebase provides the ability to store, retrieve, and delete files in the user's home directory.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 3.6.5"])
    else
      s.add_dependency(%q<bones>, [">= 3.6.5"])
    end
  else
    s.add_dependency(%q<bones>, [">= 3.6.5"])
  end
end
