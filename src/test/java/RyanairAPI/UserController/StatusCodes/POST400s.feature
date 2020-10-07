Feature: POST 400 responses


  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: status 409 returned when blank 'email' and blank 'name' entered
    * def newUser =
      """
      {
          "email": "",
          "name": ""
      }
      """

    Given path 'user'
    And request newUser
    When method post
    Then status 409


  Scenario: status 409 returned when valid 'email' and blank 'name' entered
    * def newUser =
      """
      {
          "email": "test@test.com",
          "name": ""
      }
      """

    Given path 'user'
    And request newUser
    When method post
    Then status 409


  Scenario: status 409 returned when blank 'email' and valid 'name' entered
    * def newUser =
      """
      {
          "email": "",
          "name": "Andy"
      }
      """

    Given path 'user'
    And request newUser
    When method post
    Then status 409