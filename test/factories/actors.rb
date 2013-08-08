# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :actor do
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    phone "MyString"
    email "MyString"
    user_id 1
  end
end
