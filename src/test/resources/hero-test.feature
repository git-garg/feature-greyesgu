@Héroe
Feature:

  Background: Consultar un ID existente
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    When method get
    Then status 200
    * def id = response[0].id
    * print 'El valor es' , id

  @ObtenerTodos
  Scenario: Consultar todos
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    When method get
    Then status 200
    * print response

  @ObenerHeroPorIdEncontrado
  Scenario: Consulta Héroe por ID encontrado
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/' + id
    When method get
    Then status 200
    * print response

  @ObenerHeroPorIdOutline
  Scenario Outline: Consulta Héroe por ID <data_id>
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/<data_id>'
    When method get
    Then status 200
    * print response
    Examples:
      | data_id |
      | 20      |

  @CrearNuevoHeroe
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

  @CreaVerificaExistente
  Scenario: Crear y verificar existente
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

  @ActualizarHeroe
  Scenario: Actualizar registro
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/' + id
    And request
      """
      {
        "name": "Iron Man Actualizado",
        "alterego": "Tony Stark",
        "description": "Updated description",
        "powers": ["Armor", "Flight"]
      }
      """
    When method put
    Then status 200

  @ActualizarHeroe
  Scenario: Eliminar registro
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/' + id
    When method delete
    Then status 204