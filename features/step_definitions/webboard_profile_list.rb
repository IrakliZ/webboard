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

Given(/^(?:|I )am on the (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^(?:|I )go to (.+)$/) do |page_name|
  visit path_to(page_name)
end
