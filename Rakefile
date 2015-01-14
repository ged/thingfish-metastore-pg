#!/usr/bin/env rake

begin
	require 'hoe'
rescue LoadError
	abort "This Rakefile requires hoe (gem install hoe)"
end

GEMSPEC = 'thingfish-metastore-pg.gemspec'


Hoe.plugin :mercurial
Hoe.plugin :signing
Hoe.plugin :deveiate
Hoe.plugin :bundler

Hoe.plugins.delete :rubyforge
Hoe.plugins.delete :gemcutter

hoespec = Hoe.spec 'thingfish-metastore-pg' do |spec|
	spec.readme_file = 'README.rdoc'
	spec.history_file = 'History.rdoc'
	spec.extra_rdoc_files = FileList[ '*.rdoc' ]
	spec.license 'BSD'

	if File.directory?( '.hg' )
		spec.spec_extras[:rdoc_options] = ['-f', 'fivefish', '-t', 'Thingfish-Metastore-PG']
	end

	spec.developer 'Michael Granger', 'ged@FaerieMUD.org'

	spec.dependency 'loggability', '~> 0.10'

	spec.dependency 'rspec', '~> 3.0', :developer

	spec.require_ruby_version( '>=2.0.0' )
	spec.hg_sign_tags = true if spec.respond_to?( :hg_sign_tags= )

	self.rdoc_locations << "deveiate:/usr/local/www/public/code/#{remote_rdoc_dir}"
end


ENV['VERSION'] ||= hoespec.spec.version.to_s

# Run the tests before checking in
task 'hg:precheckin' => [ :check_history, :check_manifest, :spec ]

# Rebuild the ChangeLog immediately before release
task :prerelease => 'ChangeLog'
CLOBBER.include( 'ChangeLog' )

desc "Build a coverage report"
task :coverage do
	ENV["COVERAGE"] = 'yes'
	Rake::Task[:spec].invoke
end


task :gemspec => GEMSPEC
file GEMSPEC => __FILE__ do |task|
	spec = $hoespec.spec
	spec.files.delete( '.gemtest' )
	spec.signing_key = nil
	spec.version = "#{spec.version}.pre#{Time.now.strftime("%Y%m%d%H%M%S")}"
	File.open( task.name, 'w' ) do |fh|
		fh.write( spec.to_ruby )
	end
end

task :default => :gemspec

