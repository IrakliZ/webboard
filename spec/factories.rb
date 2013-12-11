FactoryGirl.define do
  factory :user do
    sequence(:name)   { |n| "Person #{n}"}  #{}"Web User"
    sequence (:email)  { |n| "person_#{n}@example.com"} #"user@webboard.com"
    password "secretpass"
    password_confirmation "secretpass"

    factory :admin do 
    	admin true 
    end 
  end
end