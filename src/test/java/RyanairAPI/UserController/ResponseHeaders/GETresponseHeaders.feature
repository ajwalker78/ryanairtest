Feature: GET response headers


  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: validate correct content type for status 200
    Given path 'user'
    And param id = 'pepe@pepe.pe1-0.1'
    When method get
    Then match header Content-Type == 'application/json;charset=UTF-8'
    And status 200


  Scenario: validate correct date for status 200
    Given path 'user'
    And param id = 'pepe@pepe.pe1-0.1'
    When method get
    Then match header Date == '#notnull'
    And status 200


  Scenario: validate correct transfer encoding for status 200
    Given path 'user'
    And param id = 'pepe@pepe.pe1-0.1'
    When method get
    Then match header Transfer-Encoding == 'chunked'
    And status 200


  Scenario: validate correct content length for status 404
    Given path 'user'
    And param id = 'test'
    When method get
    Then match header Content-Length == '14'
    And status 404


  Scenario: validate correct content type for status 404
    Given path 'user'
    And param id = 'test'
    When method get
    Then match header Content-Type == 'text/plain;charset=UTF-8'
    And status 404


  Scenario: validate correct date for status 404
    Given path 'user'
    And param id = 'test'
    When method get
    Then match header Date == '#string'
    And status 404