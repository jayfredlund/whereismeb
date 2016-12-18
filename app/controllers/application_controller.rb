class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  AVAILABLE_LOCATIONS = ["Arizona", "New Orleans", "DC", "Dallas", "San Francisco", "Raleigh",
                         "Nashville", "San Diego", "Seattle", "Chicago", "Dublin", "Philadelphia",
                         "San Jose", "Brooklyn", "Denver", "Los Angeles", "Las Vegas", "San Antonio"]

  def hi_carolyn
    @location = AVAILABLE_LOCATIONS.sample
    render 'layouts/hi_carolyn'
  end

end
