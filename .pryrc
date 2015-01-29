#!/usr/bin/ruby -*- ruby -*-

require 'configurability'
require 'loggability'
require 'pathname'
require 'strelka'

$LOAD_PATH.unshift( '../Thingfish/lib', 'lib' )

begin
	require 'thingfish'
	require 'thingfish/metastore/pg'

	Loggability.level = :debug
	Loggability.format_with( :color )

	Strelka.load_config( 'config.yml' ) if File.exist?( 'config.yml' )

rescue Exception => e
	$stderr.puts "Ack! Libraries failed to load: #{e.message}\n\t" +
		e.backtrace.join( "\n\t" )
end


