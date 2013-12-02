# encoding: utf-8 
#Add sign-up, edit user, redirecting webpage 
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
		When I click sign-up
		And I enter the name "Mr. Person"
		And I enter the email "person@gmail.com"
		And I enter the password "12345"
		And I confirm the password "12345"
		Then I will redirect to "Mr. Person" profile

	
