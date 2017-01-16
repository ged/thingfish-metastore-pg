# -*- encoding: utf-8 -*-
# stub: thingfish-metastore-pg 0.3.0.pre20170116115933 ruby lib

Gem::Specification.new do |s|
  s.name = "thingfish-metastore-pg".freeze
  s.version = "0.3.0.pre20170116115933"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Granger".freeze, "Mahlon E. Smith".freeze]
  s.cert_chain = ["/Users/ged/.gem/gem-public_cert.pem".freeze]
  s.date = "2017-01-16"
  s.description = "This is a metadata storage plugin for the Thingfish digital asset manager. It\nprovides persistent storage for uploaded data to a PostgreSQL table.".freeze
  s.email = ["ged@FaerieMUD.org".freeze, "mahlon@martini.nu".freeze]
  s.extra_rdoc_files = ["History.md".freeze, "LICENSE.md".freeze, "Manifest.txt".freeze, "README.md".freeze, "History.md".freeze, "LICENSE.md".freeze, "README.md".freeze]
  s.files = [".document".freeze, ".simplecov".freeze, "ChangeLog".freeze, "History.md".freeze, "LICENSE.md".freeze, "Manifest.txt".freeze, "README.md".freeze, "Rakefile".freeze, "data/thingfish-metastore-pg/migrations/20150114_initial.rb".freeze, "lib/thingfish/metastore/pg.rb".freeze, "lib/thingfish/metastore/pg/metadata.rb".freeze, "spec/spec_helper.rb".freeze, "spec/thingfish/metastore/pg_spec.rb".freeze]
  s.homepage = "https://bitbucket.org/ged/thingfish-metastore-pg".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "2.6.8".freeze
  s.summary = "This is a metadata storage plugin for the Thingfish digital asset manager".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thingfish>.freeze, ["~> 0.6"])
      s.add_runtime_dependency(%q<loggability>.freeze, ["~> 0.12"])
      s.add_runtime_dependency(%q<configurability>.freeze, ["~> 3.1"])
      s.add_runtime_dependency(%q<sequel>.freeze, ["~> 4.41"])
      s.add_runtime_dependency(%q<pg>.freeze, ["~> 0.19"])
      s.add_development_dependency(%q<hoe-mercurial>.freeze, ["~> 1.4"])
      s.add_development_dependency(%q<hoe-deveiate>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<hoe-highline>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.12"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.15"])
    else
      s.add_dependency(%q<thingfish>.freeze, ["~> 0.6"])
      s.add_dependency(%q<loggability>.freeze, ["~> 0.12"])
      s.add_dependency(%q<configurability>.freeze, ["~> 3.1"])
      s.add_dependency(%q<sequel>.freeze, ["~> 4.41"])
      s.add_dependency(%q<pg>.freeze, ["~> 0.19"])
      s.add_dependency(%q<hoe-mercurial>.freeze, ["~> 1.4"])
      s.add_dependency(%q<hoe-deveiate>.freeze, ["~> 0.8"])
      s.add_dependency(%q<hoe-highline>.freeze, ["~> 0.2"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.12"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
    end
  else
    s.add_dependency(%q<thingfish>.freeze, ["~> 0.6"])
    s.add_dependency(%q<loggability>.freeze, ["~> 0.12"])
    s.add_dependency(%q<configurability>.freeze, ["~> 3.1"])
    s.add_dependency(%q<sequel>.freeze, ["~> 4.41"])
    s.add_dependency(%q<pg>.freeze, ["~> 0.19"])
    s.add_dependency(%q<hoe-mercurial>.freeze, ["~> 1.4"])
    s.add_dependency(%q<hoe-deveiate>.freeze, ["~> 0.8"])
    s.add_dependency(%q<hoe-highline>.freeze, ["~> 0.2"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.12"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
  end
end
