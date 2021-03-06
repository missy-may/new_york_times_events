require 'spec_helper'
require 'httparty'
require 'json'

describe 'NewYorkTimes::GetEvents' do
  it "should return a list of 20 events" do
    latitude = "40.7127"
    longitude = "-74.0059"
    categories = ['Theater','Dance']
    binding.pry
    response = NewYorkTimes::GetEvents.new(categories, latitude, longitude).get_response
    binding.pry
  end
end

