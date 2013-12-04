# encoding: utf-8
#Add sign-up, edit user, redirecting webpage
Feature: Showcase the simplest possible Cucumber scenario

#        As a teacher
#        so that I can quickly login and open a webboard
#        I can easily draw out a lesson plan for students

#        Scenario: lesson plan for students
#                When I login to my webboard profile
#                And I open my profile
#                Then I should see my webbard files

#        Scenario: new white board
#                When I click new board
#                Then I should see a white board
                
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
         Given the following users are in the database:
         | name | email | password | password_confirmation |
         | Mr. Person | person@gmail.com | 12345678 | 12345678 |
         | Lady Ladyton | pumpiron@gmail.com | nailsforbreakfast | nailsforbreakfast |
         | Irakli Z | dovahkiin@yahoo.com | praiseTalos9 | praiseTalos9 |
        
         And I am on the homepage
         And I enter the Email "Lady Ladyton"
         And I enter the Password "nailsforbreakfast"
         And I press "Sign In"
         Then I should be on profile "Lady Ladyton"