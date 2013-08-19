FactoryGirl.define do
  factory :user do
    login
    password
    first_name  { generate :string }
    middle_name { generate :string }
    last_name   { generate :string }
    description { generate :string }
    phone
    email
  end
end
