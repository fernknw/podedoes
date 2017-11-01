
Feature: User can manually edit movie

Scenario: Edit a movie
  Given I am on the MoviePage
  When I follow "Edit info"
  Then I should be on "Edit Movie"
  When I fill in "Description" with "I watch"
  And I select "PG" from "Rating"
  And I press "Save Changes"
  
  
  