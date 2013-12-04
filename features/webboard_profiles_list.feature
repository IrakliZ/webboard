# encoding: utf-8 
#Add sign-up, edit user, redirecting webpage 
Feature: Showcase the simplest possible Cucumber scenario 
Background: adding three users
	Given the following users are in the database:
	| name           | email               | password          | password_confirmation |
	| Jeff           | jeff@gmail.com      | accesscode        | accesscode            |
	| Lady Ladyton   | pumpiron@gmail.com  | nailsforbreakfast | nailsforbreakfast     |
	| Irakli Z       | dovahkiin@yahoo.com | praiseTalos9      | praiseTalos9          |
		
	Scenario: sign-up
		Given I am on the homepage
		When I go to sign-up
		And I enter the Name "Mr. Person"
		And I enter the Email "person@gmail.com"
		And I enter the Password "12345678"
		And I enter the Confirmation "12345678"
		And I press "Create Account"
		Then I should be on profile "Mr. Person"
		
	Scenario: sign-in
	    
	    Given I am on the homepage
	    And I enter the Email "pumpiron@gmail.com"
	    And I enter the Password "nailsforbreakfast"
	    And I press "Sign In"
	    Then I should be on profile "Lady Ladyton"
	
	Scenario: sign-out
		Given I am on the homepage
		And I enter profile "Irakli Z" with email "dovahkiin@yahoo.com" with password "praiseTalos9"
		And I click link "Sign out"
		Then I should be on page homepage
		
	Scenario: edit-information
		Given I am on the homepage
		And I enter profile "Irakli Z" with email "dovahkiin@yahoo.com" with password "praiseTalos9"
		And I click link "Settings"
		And I enter the Name "Dragonborn"
		And I enter the Password "12345678"
		And I enter the Confirmation "12345678"
		And I press "Update"
		Then I should be on profile "Dragonborn"
		
