require 'spec_helper'
require 'httparty'
require 'json'

describe 'Event' do
  it "should create event object from response" do
    url = 'http://api.nytimes.com/svc/events/v2/listings.json?11=40.7127,-74.0059&radius=2500&sort=dist+asc&filters=category:(Theater+Dance)&api-key=1b6ec24de1512db2fae47f5165ce39ea:6:69563513'
    response = HTTParty.get(url,
      :query => {:oauth_token => "abc"})

    json = JSON.parse(response.body)
    binding.pry
    events = json["results"]
    event = Event.new(events.first)
    event.event_id.should eq 6812
    event.web_description.should eq "<p>(R, 1:48, in English and Hindi) Michael&#160;Winterbottom&#8217;s redo of Thomas Hardy&#8217;s &#8220;Tess of the D&#8217;Urbervilles,&#8221; set in contemporary India and starring a wan Freida Pinto, owes a bit to&#160;Bollywood and too much to the director&#8217;s reductive reading of Hardy&#8217;s novel.&#160;</p>"
  end
end

