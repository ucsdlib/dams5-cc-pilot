FactoryGirl.define do
  factory :user do
    email "example@test.com"
    password 'a password'
    password_confirmation 'a password'
    factory :admin do
      after(:build) do |user|
        def user.groups
          ['admin']
        end
      end
    end
  end
end
