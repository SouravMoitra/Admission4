FactoryGirl.define do
  factory :user do
    email    "testuser@example.com"
    password "foobar20"
    password_confirmation "foobar20"
  end
end
