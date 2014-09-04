require 'rails_helper'
require 'json'
require './lib/data_handling/formatted_data'

describe FormattedData do

	let (:json_response){ File.read('./spec/data_handling/helpers/zoe_response.json') }

	let (:zoe_data){ FormattedData.new(json_response) }

	it 'should initialize with a JSON string' do
		expect(zoe_data.json).to be json_response
	end

end