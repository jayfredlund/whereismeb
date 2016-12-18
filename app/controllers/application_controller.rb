class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hi_carolyn
    render 'layouts/hi_carolyn'
  end

end
