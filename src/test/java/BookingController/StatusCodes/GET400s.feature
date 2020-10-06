Feature: GET 400 responses


  Background:
    * url 'http://127.0.0.1:8900'


    Scenario: status 400 returned when no parameters ('id' and 'date' missing)
    Given path 'booking'
    When method get
    Then status 400


  Scenario: status 404 returned when page cannot be found
    Given path 'test'
    And param date = '2020-10-31'
    When method get
    Then status 404
