module WeathersHelper
  def location(response)
    "Location: #{response['name']}"
  end
  
  def condition(response)
    "Condition: #{response['weather'][0]['description']}"
  end
  
  def temperature(response)
    "Temperature(F): #{response['main']['temp']}"
  end
  
  def wind(response)
    "Wind: #{degrees_to_compass(response['wind']['deg'])} #{response['wind']['speed']}mph"
  end
  
  private
  
  COMPASS_DIRECTIONS = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
  
  def degrees_to_compass(degrees)
    val = ((degrees / 22.5) + 0.5).to_i
    COMPASS_DIRECTIONS[val % 16]
  end
end
