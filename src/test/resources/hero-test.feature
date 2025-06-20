@Héro
Feature:

  Scenario Outline: Consulta Héroe por ID <data_id>
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/<data_id>'
    When method get
    Then status 200
    * print response
  Examples:
    |data_id|
    |50|
    |51|

  @CrearNuevo
  Scenario: Crear personaje exitoso
    * def var = Math.random()
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And request
      """
      {
        "name": "Gabo R ",
        "alterego": "Tony Stark",
        "description": "Genius billionaire",
        "powers": ["Armor", "Flight"]
      }
      """
    When method post
    Then status 201

  @VerificaExistente
  Scenario: Crear personaje exitoso
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And request
      """
      {
        "name": "Gabo R ",
        "alterego": "Tony Stark",
        "description": "Genius billionaire",
        "powers": ["Armor", "Flight"]
      }
      """
    When method post
    Then status 400

