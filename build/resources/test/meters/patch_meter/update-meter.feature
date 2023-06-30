Feature: I as user of the Enerbit
  I want to update
  a meter with the microservice Update Meter

  Background:
    * call read("../post_create_meter/create-meter.feature@createmeter")
    * url "https://ops.enerbit.dev/learning/api/v1/meters/" + meterId
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'
    * def jsonUpdate = read('../data/updateMeter.json')
    * request jsonUpdate

  Scenario: update a meter
    When method patch
    Then status 200
    And match $.id == meterId

  Scenario: status error updating a meter
    When method patch
    Then status 201
    And match $.id == meterId

  Scenario: updating meter with seals incorrect
    * def UpdateMeterDataIncorrect = read('../data/UpdateMeterDataIncorrect.json')
    And request UpdateMeterDataIncorrect
    When method patch
    Then status 422
    And match $..detail..loc == [[  "body",  "seals"  ]]

  Scenario Outline: update non-existent meter
    Given url "https://ops.enerbit.dev/learning/api/v1/meters/" + "<id>"
    When method patch
    Then status 404
    And match $.detail == "meter not found"

    Examples:
      | id                |
      | 99999999999999999 |