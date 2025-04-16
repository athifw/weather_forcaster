class WeatherService
  CACHE_EXPIRATION = 30.minutes

  def self.get_weather_for_zip(zip)
    Rails.cache.fetch(zip.to_s, expires_in: CACHE_EXPIRATION) do
      client = OpenWeatherClient.new
      response_body = client.weather_for_zip(zip)

      {
        temp: response_body["main"]["temp"],
        temp_min: response_body["main"]["temp_min"],
        temp_max: response_body["main"]["temp_max"]
      }
    end
  end
end
