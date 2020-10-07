Feature: GET 200 responses


  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: status 200 returned when valid parameter 'id' entered
    Given path 'user'
    And param id = 'pepe@pepe.pe1-0.1'
    When method get
    Then status 200


  Scenario: status 200 returned when all users returned
    Given path 'user/all'
    When method get
    Then status 200