# -*- encoding: utf-8 -*-
# stub: thingfish-metastore-pg 0.3.0.pre.20200311133115 ruby lib

Gem::Specification.new do |s|
  s.name = "thingfish-metastore-pg".freeze
  s.version = "0.3.0.pre.20200311133115"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://todo.sr.ht/~ged/thingfish-metastore-pg", "changelog_uri" => "https://deveiate.org/code/thingfish-metastore-pg/History_md.html", "documentation_uri" => "https://deveiate.org/code/thingfish-metastore-pg", "homepage_uri" => "https://hg.sr.ht/~ged/thingfish-metastore-pg", "source_uri" => "https://hg.sr.ht/~ged/thingfish-metastore-pg" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Granger".freeze, "Mahlon E. Smith".freeze]
  s.date = "2020-03-11"
  s.description = "This is a metadata storage plugin for the Thingfish digital asset manager. It provides persistent storage for uploaded data to a PostgreSQL table.".freeze
  s.email = ["ged@FaerieMUD.org".freeze, "mahlon@martini.nu".freeze]
  s.files = [".document".freeze, ".simplecov".freeze, "History.md".freeze, "LICENSE.md".freeze, "Manifest.txt".freeze, "README.md".freeze, "Rakefile".freeze, "data/thingfish-metastore-pg/migrations/20150114_initial.rb".freeze, "lib/thingfish/metastore/pg.rb".freeze, "lib/thingfish/metastore/pg/metadata.rb".freeze, "spec/spec_helper.rb".freeze, "spec/thingfish/metastore/pg_spec.rb".freeze]
  s.homepage = "https://hg.sr.ht/~ged/thingfish-metastore-pg".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new("~> 2.5".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "This is a metadata storage plugin for the Thingfish digital asset manager.".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<pg>.freeze, ["~> 1.2"])
    s.add_runtime_dependency(%q<pluggability>.freeze, ["~> 0.7"])
    s.add_runtime_dependency(%q<sequel>.freeze, ["~> 5.30"])
    s.add_runtime_dependency(%q<sequel_pg>.freeze, ["~> 1.12"])
    s.add_runtime_dependency(%q<strelka>.freeze, ["~> 0.19"])
    s.add_development_dependency(%q<rake-deveiate>.freeze, ["~> 0.13"])
    s.add_development_dependency(%q<rdoc-generator-fivefish>.freeze, ["~> 0.4"])
  else
    s.add_dependency(%q<pg>.freeze, ["~> 1.2"])
    s.add_dependency(%q<pluggability>.freeze, ["~> 0.7"])
    s.add_dependency(%q<sequel>.freeze, ["~> 5.30"])
    s.add_dependency(%q<sequel_pg>.freeze, ["~> 1.12"])
    s.add_dependency(%q<strelka>.freeze, ["~> 0.19"])
    s.add_dependency(%q<rake-deveiate>.freeze, ["~> 0.13"])
    s.add_dependency(%q<rdoc-generator-fivefish>.freeze, ["~> 0.4"])
  end
end
