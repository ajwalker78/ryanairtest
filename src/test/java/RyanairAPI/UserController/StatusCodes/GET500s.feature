Feature: GET 500 responses


  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: status 500 returned when parameter 'id' is blank
    Given path 'user'
    And param id = ''
    When method get
    Then status 500