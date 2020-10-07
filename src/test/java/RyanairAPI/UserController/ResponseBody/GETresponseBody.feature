Feature: GET response body


  Background:
    * url 'http://127.0.0.1:8900'


  Scenario: validate correct response body for status 200

    * def r_email = 'pepe@pepe.pe1'
    * def r_name = 'pepe'
    * def r_id = 'pepe@pepe.pe1-0.1'

    Given path 'user'
    And param id = 'pepe@pepe.pe1-0.1'
    When method get
    Then match response contains
      """
      {
          "email": "#(^r_email)",
          "name": "#(^r_name)",
           "id": "#(^r_id)"
      }
      """
    And status 200


#  Scenario: validate correct response body of /user/all for status 200
#
#    * def r_email = 'pepe@pepe.pe1'
#    * def r_name = 'pepe'
#    * def r_id = 'pepe@pepe.pe1-0.1'
#
#    Given path 'user/all'
#    When method get
#    Then match response contains
#      """
#      {
#          "email": "#(^r_email)",
#          "name": "#(^r_name)",
#           "id": "#(^r_id)"
#      }
#      """
#    And status 200


  Scenario: validate correct response body for status 404
    Given path 'user'
    And param id = 'test'
    When method get
    Then match response == 'User not found'
    And status 404
