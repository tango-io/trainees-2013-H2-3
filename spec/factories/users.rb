FactoryGirl.define do
  factory :user do
    firstname 'Edgar'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
  end
end
