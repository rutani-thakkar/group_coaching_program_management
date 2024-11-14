FactoryBot.define do
  factory :coaching_program do
    name { Faker::Educator.course_name }
    company
  end
end
