Feature: Test Sorting Items
  Test sorting list items by price,
  quantity and name

Scenario: Sort items by price
    Given I am on the show items page
    And the "price" table header contains "sortdown"
    When I select "price" from the table header
    Then sort items by price in ascending order
    And the "price" table header contains "sortup"
    When I select "price" again from the table header
    Then sort items by price in descending order

Scenario: Sort items by quantity
    Given I am on the show items page
    And the "quantity" table header contains "sortdown"
    When I select "quantity" from the table header
    Then sort items by quantity in ascending order
    And the "quantity" table header contains "sortup"
    When I select "quantity" again from the table header
    Then sort items by quantity in descending order

Scenario: Sort items by name
    Given I am on the show items page
    And the "name" table header contains "sortdown"
    When I select "name" from the table header
    Then sort items by name in ascending order
    And the "name" table header contains "sortup"
    When I select "name" again from the table header
    Then sort items by name in descending order
