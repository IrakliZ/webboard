# encoding: utf-8 

Feature: Showcase the simplest possible Cucumber scenario 

	As a teacher 
	so that I can quickly login and open a webboard 
	I can easily draw out a lesson plan for students

	Scenario: lesson plan for students 
		When I login to my webboard profile 
		And I open my profile 
		Then I should see my webbard files 

	Scenario: new white board  
		When I click new board 
		Then I should see a white board 

	
