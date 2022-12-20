require 'faker'

# Students
20.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.unique.last_name
  email = "#{first_name.downcase}.#{last_name.downcase}@highschool.com"

  student = Student.create(
    first_name: first_name,
    last_name: last_name,
    grade: [9, 10, 11, 12].sample,
    email: email
  )
end
