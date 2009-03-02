Feature: Test Searching items
  search items that contain a certain string in the name field
  notify the user if the search results in no hits

Scenario: List items containing the 'c' character in the name
    Given I am on the show items page
    When I fill in the "query" field with "c"
    And I press "Find"
    Then print all the items containing 'c'
    And show a description of the search parameter

Scenario: Notify the user that there are no items matching the search query
    Given I am on the show items page
    When I fill in the "query" field with "dfdfdf"
    And I press "Find"
    Then print a message notifying the user that there is no result

Scenario: Show all items if the user clicks on "Show All Items"
    Given I am on the show items page
    When I follow "Show All Items"
    Then print all items
