Feature: Get weather data based on latitude and longitude

  Background:
    * url WEATHER_URL
    * def api_key = API_KEY


  Scenario Outline: Get weather data based on latitude and longitude
    Given params {lat: <lat>, lon:<lon>, key:'#(api_key)'}
    * header content-type = 'application/json'
    When method get
    Then status 200
    And assert response.data.length > 0
    And match response.data[0].city_name == '<city-name>'

    Examples:
      | lat      | lon      | city-name   |
      | 32.6596  | -86.7178 | Billingsley |
      | -33.8054 | 151.0739 | West Ryde   |
      | -33.7684 | 150.9365 | Blacktown   |