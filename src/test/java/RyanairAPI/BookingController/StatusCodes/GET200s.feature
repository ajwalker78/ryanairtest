Feature: GET 200 responses


  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: status 200 returned when parameter 'date' entered correctly
    Given path 'booking'
    And param date = '2020-10-31'
    When method get
    Then status 200


  Scenario: status 200 returned for parameter 'id' accepting alpha, numeric and special characters
    Given path 'booking'
    And param id = 'abc123!@£'
    When method get
    Then status 200


  Scenario: status 200 returned when acceptable parameters for 'date' and 'id' entered
    Given path 'booking'
    And param date = '2020-10-31'
    And param id = 'abc123!@£'
    When method get
    Then status 200