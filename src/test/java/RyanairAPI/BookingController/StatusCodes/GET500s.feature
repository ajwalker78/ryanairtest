Feature: GET 500 responses


  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: status 500 returned when parameter 'date' entered in incorrect format
    Given path 'booking'
    And param date = '31-10-2020'
    When method get
    Then status 500

  Scenario: status 500 returned when parameter 'date' entered in incorrect entry
    Given path 'booking'
    And param date = 'test'
    When method get
    Then status 500