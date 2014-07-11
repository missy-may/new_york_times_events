class GetEvents

  attr_accessor :categories, :latitude, :longitude

  def initialize(categories, latitude, longitude)
    @categories = categories
    @latitude = latitude
    @longitude = longitude
  end

  def get_events
    events = Array.new
    response = HTTParty.get(url,
      :query => {:oauth_token => "abc"})
    json = JSON.parse(response.body)
    json["results"].each do |event|
      events.push Event.new(event)
    end
  end

  private
    def url
      "http://api.nytimes.com/svc/events/#{version}/listings#{response_format}?#{radius}&filters=category:(#{category_list})&api-key=#{api_key}"
    end

    def radius
      "11=#{latitude},#{longitude}"
    end

    def version
      "v2"
    end

    def api_key
      "1b6ec24de1512db2fae47f5165ce39ea:6:69563513"
    end

    def response_format
      ".json"
    end

    def category_list
      categories.join('+')
    end

end
