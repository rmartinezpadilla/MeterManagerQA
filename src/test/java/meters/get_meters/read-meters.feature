Feature: I as user of the Enerbit
  I want to consult existing meters
  to see your information

  Background:
    * header Accept = 'application/json'

  Scenario: get all meters
    Given url "https://ops.enerbit.dev/learning/api/v1/meters"
    When method get
    Then status 200
    And match $.size > 0


  Scenario Outline: get meters with information
    Given url "https://ops.enerbit.dev/learning/api/v1/meters"
    And request {"page": "#(page)","size": #(size), "serial": "#(serial)", "connection_type": "#(connection_type)", "storage_system": "#(storage_system)", "condition": "#(condition)", "owner": "#(owner)",  "location": "#(location)", "manufacturer": "#(manufacturer)", "purchase": "#(purchase)", "i_max": #(i_max),  "i_b": 21.5, "i_n": #(i_n), "seals": #(seals)  }
    When method get
    Then status 200
      Examples:
      |page   |size    |  serial   |connection_type      |storage_system  |condition  |owner  |location |manufacturer   |purchase     |i_max   |i_b  |i_n    |seals     |
      |0      |  1     |  string   |indirecta            |interno         |nuevo      |RF     |string   |string         |string       |0       |0    |0      |0         |

  Scenario Outline: failed status to consult meters
    Given url "https://ops.enerbit.dev/learning/api/v1/meters"
    And request {"page": "#(page)","size": #(size), "serial": "#(serial)", "connection_type": "#(connection_type)", "storage_system": "#(storage_system)", "condition": "#(condition)", "owner": "#(owner)",  "location": "#(location)", "manufacturer": "#(manufacturer)", "purchase": "#(purchase)", "i_max": #(i_max),  "i_b": 21.5, "i_n": #(i_n), "seals": #(seals)  }
    When method get
    Then status 404
    Examples:
      |page   |size    |  serial   |connection_type   |storage_system  |condition  |owner  |location  |manufacturer    |purchase   |i_max   |i_b  |i_n    |seals     |
      |0      |  1     |  string   |directa           |interno         |nuevo      |RF     |string    |string          |string     |0       |0    |0      |0         |





