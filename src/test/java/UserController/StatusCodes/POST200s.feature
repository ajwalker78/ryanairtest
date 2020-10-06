Feature: POST 200 responses
  for help with IATA codes refer to https://www.iata.org/en/publications/directories/code-search/

  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: status 201 returned when all valid values entered
    * def newUser =
      """
      {
          "email": "test@test.com",
          "name": "Andy"
      }
      """

    Given path 'user'
    And request newUser
    When method post
    Then status 201




