5.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "example-#{n+1}@beloved.org"
  password = "password"
  User.create!(first_name:  first_name,
               last_name: last_name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
1.times do |index|
  title = "Awesome project #{index+1}"
  description = Faker::Lorem.sentence(word_count: 5)
  acquired_at = Time.now
  users.each { |user| user.projects.create!(title: title, description: description, status: Status.last, acquired_at: acquired_at) }
end
