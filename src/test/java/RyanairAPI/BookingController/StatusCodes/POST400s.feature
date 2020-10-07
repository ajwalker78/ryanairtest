Feature: POST 400 responses
  for help with IATA codes refer to https://www.iata.org/en/publications/directories/code-search/

  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: status 409 returned when 'origin' is not a valid IATA code
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "pepe@pepe.pe1-0.1",
          "origin": "x"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then status 409


  Scenario: status 409 returned when 'destination' is not a valid IATA code
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "x",
          "id": "pepe@pepe.pe1-0.1",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then status 409


  Scenario: status 400 returned when 'date' is not correct format
    * def book =
      """
      {
          "date": "31-10-2020",
          "destination": "MAN",
          "id": "pepe@pepe.pe1-0.1",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then status 400


  Scenario: status 400 returned when 'id' is not given
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then status 400
