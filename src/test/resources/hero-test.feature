@NuevoPersonaje
Feature:

  Scenario: Crear personaje exitoso
  Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    When method post
    Then status 201