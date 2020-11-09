Feature: Get weather data based on post code

  Background:
    * url WEATHER_URL
    * def api_key = API_KEY

  Scenario Outline: Get weather data based on post code
    Given params {postal_code: <postcode>, country:'<country>', key:'#(api_key)'}
    * header content-type = 'application/json'
    When method get
    Then status 200
    And assert response.data.length > 0
    And match response.data[0].city_name == '<city-name>'

    Examples:
      | postcode | country | city-name   |
      | 2114     | au      | West Ryde   |
      | 2147     | au      | Blacktown   |
      | 36006    | us      | Billingsley |
      | 2147     | au      | Blacktown   |

  Scenario Outline: Some negative test
    Given params {postal_code: <postcode>, country:'<country>', key:'#(api_key)'}
    * header content-type = 'application/json'
    When method get
    Then status 200
    And assert response.data.length = 0

    Examples:
      | postcode | country |
      | 2147     | us      |
