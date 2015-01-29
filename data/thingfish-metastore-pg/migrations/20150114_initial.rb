# vim: set nosta noet ts=4 sw=4:

### The initial Thingfish::Metastore::PG DDL.
###
class Initial < Sequel::Migration

	def up
		create_schema( :thingfish, if_not_exists: true )
		create_table( :thingfish__metadata ) do
			uuid        :oid,           primary_key: true
			text        :format,        null: false
			int         :extent,        null: false
			timestamptz :created,       null: false, default: Sequel.function(:now)
			inet        :uploadaddress, null: false
			jsonb       :user_metadata, null: false, default: '{}'
		end
	end

	def down
		drop_table( :thingfish__metadata )
	end
end

