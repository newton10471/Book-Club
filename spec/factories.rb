FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    locked false

    factory :admin do
      admin true
    end

    factory :locked do
    	locked true
    end
  end
end