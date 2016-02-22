FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :admin, class: User do
    email 
    password "tinospassword"
    admin true
    first_name "Admin"
    last_name "User"
  end
  
  factory :user do
    email 
    password "alanspassword"
    first_name "Alan"
    last_name "Example"
    admin false
  end

end