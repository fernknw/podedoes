Feature: Redirect to movie page that was added by user

Background: As a movie fan, I want to view the page of the new movie that I just added, so that I don't have to find it in the index page.
  
Scenario: Add a movie
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on the movie page for "Men In Black"