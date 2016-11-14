# -*- encoding: utf-8 -*-
# stub: thingfish-metastore-pg 0.2.0.pre20161114094927 ruby lib

Gem::Specification.new do |s|
  s.name = "thingfish-metastore-pg"
  s.version = "0.2.0.pre20161114094927"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michael Granger", "Mahlon E. Smith"]
  s.cert_chain = ["/Users/ged/.gem/gem-public_cert.pem"]
  s.date = "2016-11-14"
  s.description = "This is a metadata storage plugin for the Thingfish digital asset manager. It\nprovides persistent storage for uploaded data to a PostgreSQL table."
  s.email = ["ged@FaerieMUD.org", "mahlon@martini.nu"]
  s.extra_rdoc_files = ["History.md", "LICENSE.md", "Manifest.txt", "README.md", "History.md", "LICENSE.md", "README.md"]
  s.files = [".document", ".simplecov", "ChangeLog", "History.md", "LICENSE.md", "Manifest.txt", "README.md", "Rakefile", "data/thingfish-metastore-pg/migrations/20150114_initial.rb", "lib/thingfish/metastore/pg.rb", "lib/thingfish/metastore/pg/metadata.rb", "spec/spec_helper.rb", "spec/thingfish/metastore/pg_spec.rb"]
  s.homepage = "https://bitbucket.org/ged/thingfish-metastore-pg"
  s.licenses = ["BSD-3-Clause"]
  s.rdoc_options = ["--main", "README.md"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  s.rubygems_version = "2.5.1"
  s.summary = "This is a metadata storage plugin for the Thingfish digital asset manager"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thingfish>, ["~> 0.5"])
      s.add_runtime_dependency(%q<loggability>, ["~> 0.11"])
      s.add_runtime_dependency(%q<configurability>, ["~> 2.2"])
      s.add_runtime_dependency(%q<sequel>, ["~> 4.35"])
      s.add_runtime_dependency(%q<pg>, ["~> 0.19"])
      s.add_development_dependency(%q<hoe-mercurial>, ["~> 1.4"])
      s.add_development_dependency(%q<hoe-deveiate>, ["~> 0.8"])
      s.add_development_dependency(%q<hoe-highline>, ["~> 0.2"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.12"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.15"])
    else
      s.add_dependency(%q<thingfish>, ["~> 0.5"])
      s.add_dependency(%q<loggability>, ["~> 0.11"])
      s.add_dependency(%q<configurability>, ["~> 2.2"])
      s.add_dependency(%q<sequel>, ["~> 4.35"])
      s.add_dependency(%q<pg>, ["~> 0.19"])
      s.add_dependency(%q<hoe-mercurial>, ["~> 1.4"])
      s.add_dependency(%q<hoe-deveiate>, ["~> 0.8"])
      s.add_dependency(%q<hoe-highline>, ["~> 0.2"])
      s.add_dependency(%q<simplecov>, ["~> 0.12"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.15"])
    end
  else
    s.add_dependency(%q<thingfish>, ["~> 0.5"])
    s.add_dependency(%q<loggability>, ["~> 0.11"])
    s.add_dependency(%q<configurability>, ["~> 2.2"])
    s.add_dependency(%q<sequel>, ["~> 4.35"])
    s.add_dependency(%q<pg>, ["~> 0.19"])
    s.add_dependency(%q<hoe-mercurial>, ["~> 1.4"])
    s.add_dependency(%q<hoe-deveiate>, ["~> 0.8"])
    s.add_dependency(%q<hoe-highline>, ["~> 0.2"])
    s.add_dependency(%q<simplecov>, ["~> 0.12"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.15"])
  end
end
