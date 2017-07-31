FactoryGirl.define do
  factory :user do
    name "Example"
    email "user@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
