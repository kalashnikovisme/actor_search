FactoryGirl.define do
  factory :model do
    first_name  { generate :string }
    middle_name { generate :string }
    last_name   { generate :string }
    phone
    email
    user
  end
end
