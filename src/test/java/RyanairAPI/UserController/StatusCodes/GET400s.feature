Feature: GET 400 responses


  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: status 404 returned when invalid parameter 'id' entered
    Given path 'user'
    And param id = 'test'
    When method get
    Then status 404
