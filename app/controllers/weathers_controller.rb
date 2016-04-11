class WeathersController < ApplicationController
  def show
    @response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?zip=' + zipcode_param + ',us&units=imperial&appid=' + ENV['open_weather_map_api_key'])
    
    if @response['cod'] == "404"
      flash[:error] = '<strong>' + @response["message"] + '</strong> Please enter a valid zipcode (ex. 94040).'
      redirect_to root_path
    end
  end
  
  private
  
  def zipcode_param
    params.require(:zipcode)
  end
end
