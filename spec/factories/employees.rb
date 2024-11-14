FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    position { Faker::Job.position }
    department { Faker::Company.industry }
    company
  end
end

