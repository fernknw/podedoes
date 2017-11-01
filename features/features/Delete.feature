
Feature: User can manually delete movie

Scenario: Delete a movie
  Given I am on the MoviePage
  When I follow "Delete"
  Then I should be on the RottenPotatoes home page
 
 