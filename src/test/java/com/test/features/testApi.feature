Feature: fetching and Adding User Details
  Scenario: testing the get call for User Details

    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200

  Scenario: testing to add User Details
    Given request read('classpath:com/test/requests/Create.json')
    And header Content-Type = 'application/json; charset=UTF-8'
    Given url 'https://reqres.in/api/users'
    When method POST
    Then status 201
    And match $.name == 'morpheus'

  Scenario Outline: testing to add User Details using TestData
    Given request read('classpath:com/test/requests/Create1.json')
    Given url 'https://reqres.in/api/users'
    When method POST
    Then status 201

    Examples:
      | Name       | Job
      | avijit     | It
      | Kucho      | Bodmaysi

  Scenario Outline: testing to User Login
    Given request read('classpath:com/test/requests/Login.json')
    Given url 'https://reqres.in/api/login'
    When method POST
    Then status 200
    And print response

    Examples:
      | read('classpath:com/test/testData/testData.csv') |