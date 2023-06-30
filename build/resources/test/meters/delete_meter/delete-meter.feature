Feature: I as user of the Enerbit
  i want to delete
  a meter  with the microservice Delete Meter

  Background:
    * header Accept = 'application/json'

  @deletemeter
  Scenario: delete a meter
    * call read("../post_create_meter/create-meter.feature@createmeter")
    Given url "https://ops.enerbit.dev/learning/api/v1/meters/" + meterId
    When method delete
    Then status 202

  Scenario: Failed to delete meter with id incorrect
    Given url "https://ops.enerbit.dev/learning/api/v1/meters/xyz"
    When method delete
    Then status 422
    And match $ == {  "detail": [  {  "loc": [  "path",  "id"  ],  "msg": "value is not a valid integer",  "type": "type_error.integer"  }  ]  }

  Scenario Outline: delete non-existent meter
    Given url "https://ops.enerbit.dev/learning/api/v1/meters/" + "<id>"
    When method delete
    Then status 404
    And match $.detail == "meter not found"

    Examples:
      | id                |
      | 99999999999999999 |

  Scenario Outline: Failed to delete meter
  : Failed to delete meter
    Given url "https://ops.enerbit.dev/learning/api/v1/meters/" + "<id>"
    When method delete
    Then status 202

    Examples:
      | id                |
      | 99999999999999999 |