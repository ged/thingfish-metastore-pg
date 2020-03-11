# -*- ruby -*-
# frozen_string_literal: true

require 'sequel/model'

require 'thingfish/mixins'
require 'thingfish/metastore/pg' unless defined?( Thingfish::Metastore::PG )


# A row of metadata describing an asset in a Thingfish store.
class Thingfish::Metastore::PG::Metadata < Sequel::Model( :metadata )
	include Thingfish::Normalization

	# Allow instances to be created with a primary key
	unrestrict_primary_key


	# Dataset methods
	dataset_module do

		### Dataset method: Limit results to metadata which is for a related resource.
		def related
			return self.exclude( self.user_metadata_expr('relation') => nil )
		end


		### Dataset method: Limit results to metadata which is not for a related resource.
		def unrelated
			return self.where_metadata( relation: nil )
		end


		### Return a dataset which will select metadata of resources related to the
		### resource with the given +oid+.
		def related_to( oid )
			oid = oid.oid if oid.respond_to?( :oid ) # Support query by model object
			oid = Thingfish::Normalization.normalize_oid( oid )

			return self.where_metadata( relation: oid )
		end


		### Dataset method: Limit results to records whose operational or user
		### metadata matches the values from the specified +hash+.
		def where_metadata( hash )
			ds = self
			hash.each do |field, value|
				if Thingfish::Metastore::PG::Metadata.metadata_columns.include?( field.to_sym )
					ds = ds.where( field.to_sym => value )
				else
					ds = ds.where( self.user_metadata_expr(field) => value )
				end
			end

			return ds
		end


		### Dataset method: Order results by the specified +columns+.
		def order_metadata( *columns )
			columns.flatten!
			ds = self
			columns.each do |column|
				if Thingfish::Metastore::PG::Metadata.metadata_columns.include?( column.to_sym )
					ds = ds.order_append( column.to_sym )
				else
					ds = ds.order_append( self.user_metadata_expr(column) )
				end
			end

			return ds
		end


		#########
		protected
		#########

		### Returns a Sequel expression suitable for use as the key of a query against
		### the specified user metadata field.
		def user_metadata_expr( field )
			return Sequel.pg_jsonb( :user_metadata ).get_text( field.to_s )
		end

	end # dataset_module


	### Return a new Metadata object from the given +oid+ and one-dimensional +hash+
	### used by Thingfish.
	def self::from_hash( hash )
		metadata = Thingfish::Normalization.normalize_keys( hash )

		md = new

		md.format        = metadata.delete( 'format' )
		md.extent        = metadata.delete( 'extent' )
		md.created       = metadata.delete( 'created' )
		md.uploadaddress = metadata.delete( 'uploadaddress' ).to_s

		md.user_metadata = Sequel.pg_jsonb( metadata )

		return md
	end


	### Return the columns of the table that are used for resource metadata.
	def self::metadata_columns
		return self.columns - [self.primary_key, :user_metadata]
	end


	### Do some initial attribute setup for new objects.
	def initialize( * )
		super
		self[ :user_metadata ] ||= Sequel.pg_jsonb({})
	end


	### Return the metadata as a Hash; overridden from Sequel::Model to
	### merge the user and system pairs together.
	def to_hash
		hash = self.values

		hash.delete( :oid )
		hash.merge!( hash.delete(:user_metadata) )

		return normalize_keys( hash )
	end


	### Merge new metadata +values+ into the metadata for the resource
	def merge!( values )

		# Extract and set the column-metadata values first
		self.class.metadata_columns.each do |col|
			next unless values.key?( col.to_s )
			self[ col ] = values.delete( col.to_s )
		end

		self.user_metadata.merge!( values )
	end


	#########
	protected
	#########

	### Proxy method -- fetch a value from the metadata hash if it exists.
	def method_missing( sym, *args, &block )
		return super if sym == :user_metadata
		return self.user_metadata[ sym.to_s ] || super
	end

end # Thingfish::Metastore::PG::Metadata

