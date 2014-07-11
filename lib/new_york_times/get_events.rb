module NewYorkTimes
  class GetEvents

    attr_accessor :categories, :latitude, :longitude

    def initialize(categories, latitude, longitude)
      @categories = categories
      @latitude = latitude
      @longitude = longitude
    end

    def get_response
      response = HTTParty.get(URI(url),
        :query => {:oauth_token => "abc"})
      JSON.parse(response.body)
    end



    private
      def url
        "http://api.nytimes.com/svc/events/#{version}/listings#{response_format}?#{radius}&filters=category#{categories}&sort=#{sort}&api-key=#{api_key}"
      end

      def radius
        "11=#{latitude},#{longitude}"
      end

      def sort
        "dist+asc"
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

      def filters
        "category: (#{categories.join('+')})"
      end

  end
end
