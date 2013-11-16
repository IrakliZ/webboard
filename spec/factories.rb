FactoryGirl.define do
  factory :user do
    name     "Web User"
    email    "user@webboard.com"
    password "secretpass"
    password_confirmation "secretpass"
  end
end