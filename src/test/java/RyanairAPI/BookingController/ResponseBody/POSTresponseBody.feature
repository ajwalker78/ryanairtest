Feature: POST response body
  for help with IATA codes refer to https://www.iata.org/en/publications/directories/code-search/

  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: validate correct response for status 201
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "pepe@pepe.pe1-0.1",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then status 201
    And match response ==
    """
    { "idBooking": "#notnull",
    "idUser": "pepe@pepe.pe1-0.1",
    "origin": "MAD",
    "destination": "MAN",
    "date": "2020-10-31" }
    """


  Scenario: validate correct response when 'destination' and/or 'origin' missing for status 409
    * def book =
      """
      {
           "date": "2020-10-31",
           "destination": "x",
           "id": "pepe@pepe.pe1-0.1",
           "origin": "x"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match response == 'Origin or Destination is not a IATA code (Three Uppercase Letters)'
    And status 409


  Scenario: validate correct response for missing 'id' for status 400
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
    Then match response == 'User id should be valid'
    And status 400


  Scenario: validate correct response for missing 'id' for status 500
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
    Then match response ==
      """
      {
          "timestamp": "#string",
          "status": 500,
          "error": "Internal Server Error",
          "message": "#string",
          "path": "/booking"
      }
      """
    And status 500
