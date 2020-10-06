Feature: POST 500 responses
  for help with IATA codes refer to https://www.iata.org/en/publications/directories/code-search/

  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: status 500 returned when 'id' is not correct
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "x",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then status 500



  Scenario: status 500 returned when all expected values not present
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then status 500