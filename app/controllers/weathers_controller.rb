class WeathersController < ApplicationController
  def show
    @response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?zip=' + zipcode_param + ',us&appid=' + ENV['open_weather_map_api_key'])
  end
  
  private
  
  def zipcode_param
    params.require(:zipcode)
  end
end
