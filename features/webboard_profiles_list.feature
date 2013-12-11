# encoding: utf-8 
#Add sign-up, edit user, redirecting webpage 
<<<<<<< HEAD
Feature: User basic sign-in
	As a new user
	So that I can have my own profile
	I want set up a profile to my email and password 
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
	
	Scenario: Cannot edit when signed off
=======
Feature: Showcase the simplest possible Cucumber scenario 

#	As a teacher 
#	so that I can quickly login and open a webboard 
#	I can easily draw out a lesson plan for students

#	Scenario: lesson plan for students 
#		When I login to my webboard profile 
#		And I open my profile 
#		Then I should see my webbard files 

#	Scenario: new white board  
#		When I click new board 
#		Then I should see a white board 
		
	Scenario: sign-in
		Given I am on the homepage
		When I go to sign-up
		And I enter the name "Mr. Person"
		And I enter the email "person@gmail.com"
		And I enter the password "12345678"
		And I enter the confirm "12345678"
		And I press "Create Account"
		Then I should be on profile "Mr. Person"
		#And I should see "Mr. Person"

	
>>>>>>> master
