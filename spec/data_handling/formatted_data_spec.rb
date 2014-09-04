require 'rails_helper'
require 'json'
require './lib/data_handling/formatted_data'

describe FormattedData do

	let (:json_response){ File.read('./spec/data_handling/helpers/zoe_response.json') }

	let (:zoe_data){ FormattedData.new(json_response) }

	it "should initialize with a JSON string" do
		expect(zoe_data.json).to be json_response
	end

	context "getting Zoe's steps" do

		it "starts with an empty array for steps" do
			expect(zoe_data.steps).to eq []
		end

		xit "returns an array containing steps with lat, lon, and time" do
			# zoe_data.
		end

	end

end



	# data_hash[0]['segments']
	# [1]['activities'][0]['trackPoints']

