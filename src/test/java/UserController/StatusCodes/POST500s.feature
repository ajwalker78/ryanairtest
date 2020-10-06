Feature: POST 500 responses
  for help with IATA codes refer to https://www.iata.org/en/publications/directories/code-search/

  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: status 500 returned when invalid 'email' format and valid 'name' entered
    * def newUser =
      """
      {
          "email": "12345",
          "name": "Andy"
      }
      """

    Given path 'user'
    And request newUser
    When method post
    Then status 500
