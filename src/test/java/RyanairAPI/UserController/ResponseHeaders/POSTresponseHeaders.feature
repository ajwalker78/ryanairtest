Feature: POST response headers
  for help with IATA codes refer to https://www.iata.org/en/publications/directories/code-search/

  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: validate correct content type for status 201
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "pepe@pepe.pe1-0.1",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Content-Type == 'application/json;charset=UTF-8'
    And status 201


  Scenario: validate date is not blank for status 201
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "pepe@pepe.pe1-0.1",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Date == '#notnull'
    And status 201


  Scenario: validate correct transfer encoding for status 201
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "pepe@pepe.pe1-0.1",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Transfer-Encoding == 'chunked'
    And status 201


  Scenario: validate correct content length for status 409
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "x",
          "id": "pepe@pepe.pe1-0.1",
          "origin": "x"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Content-Length == '66'
    And status 409


  Scenario: validate correct content type for status 409
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "x",
          "id": "pepe@pepe.pe1-0.1",
          "origin": "x"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Content-Type == 'text/plain;charset=UTF-8'
    And status 409


  Scenario: validate date not blank for status 409
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "x",
          "id": "pepe@pepe.pe1-0.1",
          "origin": "x"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Date == '#notnull'
    And status 409


  Scenario: validate correct connection for status 400
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Connection == 'close'
    And status 400


  Scenario: validate correct content length for status 400
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Content-Type == 'text/plain;charset=UTF-8'
    And status 400


  Scenario: validate correct content length for status 400
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Date == '#notnull'
    And status 400


  Scenario: validate correct connection when status 500
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "x",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Connection == 'close'
    And status 500


  Scenario: validate correct content type when status 500
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "x",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Content-Type == 'application/json;charset=UTF-8'
    And status 500


  Scenario: validate date not blank when status 500
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "x",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Content-Type == 'application/json;charset=UTF-8'
    And status 500


  Scenario: validate correct transfer encoding when status 500
    * def book =
      """
      {
          "date": "2020-10-31",
          "destination": "MAN",
          "id": "x",
          "origin": "MAD"
      }
      """
    Given path 'booking'
    And request book
    When method post
    Then match header Content-Type == 'application/json;charset=UTF-8'
    And status 500