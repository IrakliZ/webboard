def page_title(page_title)
  main_title = "Webboard"
  if page_title.empty?
    main_title
  else
    "#{main_title} | #{page_title}"
  end
end

def sign_in(user, options={})
  visit root_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
end

include ApplicationHelper

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end
