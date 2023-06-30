Feature: I as user of the Enerbit
  i want to create a meter
  from the microservice Create Meter

  Background:
    * url "https://ops.enerbit.dev"
    * path "/learning/api/v1/meters"
    * header Accept = 'application/json'
    * def jsonResponse = read('../data/ExpectedGetMeterJson.json')
    * def jsonCreate = read('../data/CreateMeter.json')
    * request jsonCreate

  @createmeter
  Scenario: create new meter
    When method post
    Then status 201
    And match $ == jsonResponse
    And def meterId = $.id

   # Examples:
   #   |serial         |connection_type    |storage_system  |condition  |owner  |location         |manufacturer |purchase                     |i_max    |i_b  |i_n    |seals    |
   #   |1067890893     |indirecta          |externo         |usado      |RF     |Almacen monteria |yes          |2020-07-28 03:08:49.340514   |4444.654 |44.5 |444.5  |444.65   |

  @CreateMeterNumberDataInvalid
  Scenario: error create new meter with number data incorrect
    * def jsonCreateError = read('../data/CreateMeterDataNumericInvalid.json')
    * def ExpectedCreateMeterWhitDataNumericIncorrect =  read('../data/ExpectedCreateMeterWhitDataNumericIncorrect.json')
    And request jsonCreateError
    When method post
    Then status 422
    And match $ == ExpectedCreateMeterWhitDataNumericIncorrect

  @CreateMeterConnectionType
  Scenario: error create new meter with connection type incorrect
    * def jsonCreateError = read('../data/CreateMeterConnectionTypeError.json')
    * def ExpectedCreateMeterWhitConnectionTypeIncorrect =  read('../data/ExpectedCreateMeterWhitConnectionTypeIncorrect.json')
    And request jsonCreateError
    When method post
    Then status 422
    And match $ == ExpectedCreateMeterWhitConnectionTypeIncorrect

  @CreateMeterStorageSystemError
  Scenario: error create new meter with storage system incorrect
    * def jsonCreateError = read('../data/CreateMeterConnectionStorageSystemError.json')
    * def ExpectedCreateMeterStorageSystemIncorrect =  read('../data/ExpectedCreateMeterStorageSystemIncorrect.json')
    And request jsonCreateError
    When method post
    Then status 422
    And match $ == ExpectedCreateMeterStorageSystemIncorrect

  @CreateMeterConditionError
  Scenario: error create new meter with condition incorrect
    * def jsonCreateError = read('../data/CreateMeterConditionError.json')
    * def ExpectedCreateMeterWhitConditionIncorrect =  read('../data/ExpectedCreateMeterWhitConditionIncorrect.json')
    And request jsonCreateError
    When method post
    Then status 422
    And match $ == ExpectedCreateMeterWhitConditionIncorrect

  @CreateMeterOwnerError
  Scenario: error create new meter with owner incorrect
    * def jsonCreateError = read('../data/CreateMeterOwnerError.json')
    * def ExpectedCreateMeterWhitOwnerIncorrect =  read('../data/ExpectedCreateMeterWhitOwnerIncorrect.json')
    And request jsonCreateError
    When method post
    Then status 422
    And match $ == ExpectedCreateMeterWhitOwnerIncorrect

  Scenario Outline: status error create a meter
    When method post
    Then status 404
    And match $ == jsonResponse
    And def meterId = $.id

    Examples:
      |serial         |connection_type    |storage_system  |condition  |owner  |location         |manufacturer |purchase                     |i_max    |i_b  |i_n    |seals    |
      |1067890893     |indirecta          |externo         |usado      |RF     |Almacen monteria |yes          |2020-07-28 03:08:49.340514   |4444.654 |44.5 |444.5  |444.65   |
