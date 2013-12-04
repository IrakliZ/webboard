#encoding: utf-8

When(/^I login to my webboard profile$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I open my profile$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see my webbard files$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click new board$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a white board$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the following users are in the database:/) do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given(/^(?:|I )am on the (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^(?:|I )go to (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^(?:|I )enter the (.+) "(.+)"$/) do |field, value|
  #fill_in("form-#{field}", :with =>value)
  fill_in("#{field}", :with =>"#{value}")
end

When(/^(?:|I )press "(.*)"$/) do |button|
  click_button(button)
end

When(/^(?:I )click link "(.*)"$/) do |link|
  click_link(link)
end

Then(/^I should be on profile "(.*)"$/) do |user_name|
  current_path = URI.parse(current_url).path
  #p current_path
  assert current_path =~ /users\/\d+/
  #p page.has_title? (user_name)
  assert page.has_title?(user_name)
end

Then(/^I should be on page (.*)$/) do |page|
  current_path = URI.parse(current_url).path
  assert current_path == path_to(page)
end

Given(/(?:I )enter profile "(.*)" with email "(.*)" with password "(.*)"$/) do |name, email, pass|
  step "I enter the Email \"#{email}\""
  step "I enter the Password \"#{pass}\""
  step "I press \"Sign In\""
  step "I should be on profile \"#{name}\""
end









 
