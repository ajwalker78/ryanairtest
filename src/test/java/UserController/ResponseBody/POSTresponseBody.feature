Feature: POST response body


  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: validate correct response body for status 201
    * def book =
      """
      {
          "email": "test@test.com",
          "name": "Andy"
      }
      """

    * def emailID = 'test@test.com'

    Given path 'user'
    And request book
    When method post
    Then status 201
    And match response contains
      """
      {
          "email": "test@test.com",
          "id": "#(^emailID)",
          "name": "Andy",
          "bookings": []
      }
      """

  Scenario: validate correct response body for status 409
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
    And match response == 'Check fields'


  Scenario: validate correct response body of incorrect email format for status 500
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
    And match response ==
      """
      {
          "timestamp": "#notnull",
          "status": 500,
          "error": "Internal Server Error",
          "message": "malformed email",
          "path": "/user"
      }
      """