#!/usr/bin/ruby
# coding: utf-8

BEGIN {
	require 'pathname'
	basedir = Pathname( __FILE__ ).dirname.parent

	thingfishdir = basedir.parent + 'Thingfish'
	thingfishlib = thingfishdir + 'lib'

	$LOAD_PATH.unshift( thingfishlib.to_s ) if thingfishlib.exist?
}


# SimpleCov test coverage reporting; enable this using the :coverage rake task
require 'simplecov' if ENV['COVERAGE']

require 'loggability'
require 'loggability/spechelpers'
require 'configurability'
require 'configurability/behavior'

require 'rspec'
require 'thingfish'
require 'thingfish/spechelpers'
require 'thingfish/behaviors'
require 'thingfish/metastore'

Loggability.format_with( :color ) if $stdout.tty?

# Some helper functions for testing. Usage:
#
#    # in spec/spec_helper.rb
#    RSpec.configure do |c|
#      c.include( Thingfish::Metastore::PG::SpecHelpers )
#    end
#
#    # in my_class_spec.rb; mark an example as needing database setup
#    describe MyClass, db: true do
#    end
#
module Thingfish::MetastorePGSpecHelpers

	TESTDB_ENV_VAR = 'THINGFISH_DB_URI'

	### Inclusion callback -- install some hooks
	def self::included( context )

		context.before( :all ) do
			if ((db_uri = ENV[ TESTDB_ENV_VAR ]))
				Thingfish::Metastore::PG.configure( uri: db_uri )
			end
		end

		context.after( :all ) do
			Thingfish::Metastore::PG.teardown_database if Thingfish::Metastore::PG.db
		end

		context.around( :each ) do |example|
			if (( setting = example.metadata[:db] ))
				Loggability[ Thingfish::Metastore::PG ].debug "DB setting: %p" % [ setting ]

				if ((db = Thingfish::Metastore::PG.db))
					if setting == :no_transaction || setting == :without_transaction
						Loggability[ Thingfish::Metastore::PG ].debug "  running without a transaction"
						example.run
					else
						Loggability[ Thingfish::Metastore::PG ].debug "  running with a transaction"
						db.transaction( rollback: :always ) do
							example.run
						end
					end
				elsif setting.to_s == 'pending'
					example.metadata[:pending] ||=
						"a configured database URI in #{TESTDB_ENV_VAR}"
				else
					fail "No database connection! " +
					     "Ensure you have the #{TESTDB_ENV_VAR} ENV variable set to " +
						 "the URI of an (empty) test database you have write permissions to."
				end
			else
				example.run
			end
		end

		super
	end

end # module Thingfish::Metastore::PG::SpecHelpers


### Mock with RSpec
RSpec.configure do |c|
	include Thingfish::SpecHelpers
	include Thingfish::SpecHelpers::Constants

	c.run_all_when_everything_filtered = true
	c.filter_run :focus
	c.order = 'random'
	c.mock_with( :rspec ) do |mock|
		mock.syntax = :expect
	end

	c.include( Loggability::SpecHelpers )
	c.include( Thingfish::SpecHelpers )
	c.include( Thingfish::MetastorePGSpecHelpers )
end

# vim: set nosta noet ts=4 sw=4:

