class Event

  attr_accessor :event_id, :event_schedule_id, :last_modified, :event_name, :event_detail_url, :web_description, :city, :state, :film_rating,
    :critic_name, :category, :times_pick, :free, :kid_friendly, :last_chance, :festival, :long_running_show, :previews_and_openings,
    :recurring_start_date, :recur_days, :venue_name, :geocode_latitude, :geocode_longitude, :borough, :neighborhood, :cross_street, :postal_code,
    :telephone, :venue_website, :subcategory, :theater_overview_url, :theater_ticket_url,
    :date_time_description, :street_address, :theater_review_url, :venue_detail_url, :recurring_end_date

  def initialize(attrs = {})
    attrs.each do |k, v|
      send "#{k}=", v
    end
  end

end
