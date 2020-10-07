Feature: GET response headers


  Background:
    * url 'http://127.0.0.1:8900'

  Scenario: validate correct content type for status 200
    Given path 'booking'
    And param id = '1'
    When method get
    Then match header Content-Type == 'application/json;charset=UTF-8'
    And status 200


  Scenario: validate date is not blank for status 200
    Given path 'booking'
    And param id = '1'
    When method get
    Then match header Date == '#notnull'
    And status 200


  Scenario: validate correct transfer encoding for status 200
    Given path 'booking'
    And param id = '1'
    When method get
    Then match header Transfer-Encoding == 'chunked'
    And status 200


  Scenario: validate correct connection for status 400
    Given path 'booking'
    When method get
    Then match header Connection == 'close'
    And status 400


  Scenario: validate correct content length for status 400
    Given path 'booking'
    When method get
    Then match header Content-Length == '30'
    And status 400


  Scenario: validate date is not blank for status 400
    Given path 'booking'
    When method get
    Then match header Date == '#notnull'
    And status 400


  Scenario: validate correct content type for status 500
    Given path 'booking'
    And param date = '01-01-1990'
    When method get
    Then match header Content-Type == 'application/json;charset=UTF-8'
    And status 500


  Scenario: validate date is not blank for status 500
    Given path 'booking'
    And param date = '01-01-1990'
    When method get
    Then match header Date == '#notnull'
    And status 500


  Scenario: validate correct transfer encoding for status 500
    Given path 'booking'
    And param date = '01-01-1990'
    When method get
    Then match header Transfer-Encoding == 'chunked'
    And status 500