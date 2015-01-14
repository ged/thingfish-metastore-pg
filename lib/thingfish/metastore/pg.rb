# -*- ruby -*-
#encoding: utf-8

require 'loggability'
require 'configurability'
require 'sequel'
require 'strelka'
require 'strelka/mixins'

require 'thingfish'
require 'thingfish/metastore'

# Toplevel namespace
class Thingfish::Metastore::PG < Thingfish::Metastore
	extend Loggability,
	       Configurability,
	       Strelka::MethodUtilities


	# Load Sequel extensions/plugins
	Sequel.extension :migration


	# Package version
	VERSION = '0.0.1'

	# Version control revision
	REVISION = %q$Revision$

	# The data directory that contains migration files.
	#
	DATADIR = if ENV['THINGFISH_METASTORE_PG_DATADIR']
			Pathname.new( ENV['THINGFISH_METASTORE_PG_DATADIR'] )
		elsif Gem.datadir( 'thingfish-metastore-pg' )
			Pathname.new( Gem.datadir('thingfish-metastore-pg') )
		else
			Pathname.new( __FILE__ ).dirname.parent.parent.parent +
			'data' + 'thingfish-metastore-pg'
		end

	# The default config values
	DEFAULT_CONFIG = {
		uri: 'postgres:/thingfish'
	}


	# Loggability API -- use a separate logger
	log_as :thingfish_metastore_pg

	# Configurability API -- load the `pg_metastore`
	config_key :pg_metastore

	##
	# The URI of the database to use for the metastore
	singleton_attr_accessor :uri

	##
	# The Sequel::Database that's used to access the metastore tables
	singleton_attr_accessor :db


	### Configurability API -- set up the metastore with the `pg_metastore` section of
	### the config file.
	def self::configure( config=nil )
		config = self.defaults.merge( config || {} )
		self.uri = config[:uri]
		self.setup_database
	end


	### Set up the metastore database and migrate to the latest version.
	def self::setup_database
		self.db = Sequel.connect( self.uri )

		# Ensure the database is current.
		#
		unless Sequel::Migrator.is_current?( self.db, self.migrations_dir.to_s )
			self.log.info "Installing database schema..."
			Sequel::Migrator.apply( self.db, self.migrations_dir.to_s )
		end
	end


	### Tear down the configured metastore database.
	def self::teardown_database
		self.log.info "Tearing down database schema..."
		Sequel::Migrator.apply( self.db, self.migrations_dir.to_s, 0 )
	end


	### Return the current database migrations directory as a Pathname
	def self::migrations_dir
		return DATADIR + 'migrations'
	end



	######
	public
	######

end # class Thingfish::Metastore::PG

