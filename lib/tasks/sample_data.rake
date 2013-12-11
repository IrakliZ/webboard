namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
<<<<<<< HEAD
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "secretpass",
                 password_confirmation: "secretpass")
    
=======
    make_users
    users = User.all(limit: 6)
    50.times do
      title = Faker::Lorem.sentence(5)
      users.each { |user| user.boards.create!(title: title) }
    end
  end
end

def make_users
  10.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@webboard.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
>>>>>>> ce0a0af1375a68c76ead2f02d28d47d6f96b8802
  end
end