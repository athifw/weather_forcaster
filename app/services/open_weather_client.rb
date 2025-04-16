require 'net/http'

BASE_URL = "https://api.openweathermap.org/data/2.5/weather"
API_KEY = ENV["OPEN_WEATHER_API_KEY"]

class OpenWeatherClient
  def weather_for_zip(zip)
    uri = URI(BASE_URL)
    params = {
      zip:,
      appid: API_KEY,
      units: "imperial"
    }

    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
end
