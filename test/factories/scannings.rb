FactoryGirl.define do
  factory :scanning do
    type Scanning.type.values.first
  end
end
