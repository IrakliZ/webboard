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