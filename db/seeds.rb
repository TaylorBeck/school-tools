require 'faker'

# Students
10.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.unique.last_name
  email = "#{first_name.downcase}.#{last_name.downcase}@highschool.com"

  student = Student.create(
    first_name: first_name,
    last_name: last_name,
    email: email
  )
end
