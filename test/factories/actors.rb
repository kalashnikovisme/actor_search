FactoryGirl.define do
  factory :actor do
    first_name  { generate :string }
    middle_name { generate :string }
    last_name   { generate :string }
    phone
    email
    user
  end
end
