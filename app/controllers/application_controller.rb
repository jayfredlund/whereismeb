class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  AVAILABLE_LOCATIONS = ["Arizona", "New Orleans", "DC", "Dallas", "San Francisco", "Raleigh",
                         "Nashville", "San Diego", "Seattle", "Chicago", "Dublin", "Philadelphia",
                         "San Jose", "Brooklyn", "Denver", "Los Angeles", "Las Vegas", "San Antonio"]

  MEB_IMAGE_PATHS = ["meb-boston.jpg", "meb-creek.jpg", "meb-face.jpg", "meb-flag.jpg", "meb-meat.jpg",
                     "meb-medals.jpg", "meb-subway.jpg", "mebcake.jpg"]

  def hi_carolyn
    @location = AVAILABLE_LOCATIONS.sample
    @image = MEB_IMAGE_PATHS.sample
    render 'layouts/hi_carolyn'
  end

end
