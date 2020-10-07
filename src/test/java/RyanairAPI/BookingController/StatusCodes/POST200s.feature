Feature: POST 200 responses
  for help with IATA codes refer to https://www.iata.org/en/publications/directories/code-search/

  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: status 201 returned when all valid values entered
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

