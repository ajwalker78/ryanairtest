Feature: GET response body


  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: validate response is an array for status 200

    Given path 'booking'
    And param date = '2020-10-31'
    When method get
    Then match response == '#[]'
    Then status 200


  Scenario: validate response to no parameters for status 400
    Given path 'booking'
    When method get
    Then match response == 'Bad request: date and id empty'
    And status 400


  Scenario: validate response to incorrect date format for status 500
    Given path 'booking'
    And param date = 01/01/1990
    When method get
    Then match response ==
      """
      {
        "timestamp": "#notnull",
        "status": 500,
        "error": "Internal Server Error",
        "message": "Format date not valid",
        "path": "/booking"
      }
      """
    And status 500


