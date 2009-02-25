Feature: Test Searching items
  search items that contain a certain string in the name field
  notify the user if the search results in no hits

Scenario: List items containing the 'c' character in the name
    When I am on the show items page
    When I fill in the "query" field with "c"
    And I press "Find"
    Then print all the items containing 'c'
    And show a description of the search parameter
