#!/usr/bin/env rspec -cfd
#encoding: utf-8

require_relative '../../spec_helper'

require 'rspec'

require 'thingfish/behaviors'
require 'thingfish/metastore/pg'

RSpec.describe Thingfish::Metastore::PG, db: true do

	it_should_behave_like "a Thingfish metastore"

end

