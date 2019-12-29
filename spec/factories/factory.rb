FactoryBot.define do
  factory :posts, class: "Post" do
    description { "Test" }
    user_id  { 1 }    
  end

  factory :user, class: "User" do 
    first_name { "Test" }
    last_name { "Test" }
    email { "email@email.com" }
    phone_number { "123" }
    password { "p" }
    password_confirmation { "p" }
  end 
end