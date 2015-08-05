FactoryGirl.define do
  factory :order do
    name           {Faker::Lorem.characters(rand(3..50))}
    address        {Faker::Lorem.characters(rand(10..50))}
    price          {Faker::Number.positive(1.00,50.00)} 
    email          {Faker::Internet.email}

  end

end
