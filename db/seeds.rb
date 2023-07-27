# frozen_string_literal: true

5.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n + 1}@beloved.org"
  password = "password"
  User.create!(first_name: first_name,
               last_name: last_name,
               email: email,
               password: password,
               password_confirmation: password)
end

# generate data for statuses
Status.create(title: "Done", background: "#64d974")
Status.create(title: "In progress", background: "#07c0e3")
Status.create(title: "Ongoing", background: "#6d28f1")
Status.create(title: "Unknown", background: "#b3a8a9")

# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
1.times do |index|
  title = "Awesome project #{index + 1}"
  description = Faker::Lorem.sentence(word_count: 5)
  acquired_at = Time.zone.now
  users.each { |user| user.projects.create!(title: title, description: description, status: Status.last, acquired_at: acquired_at) }
end
