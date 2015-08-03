FactoryGirl.define do
  factory :menu do
    title          {Faker::Lorem.characters(rand(3..50))}
    description    {Faker::Lorem.sentence(rand(4..6),false,6)}
    price          {Faker::Number.positive(1.00,50.00)} 
    published_on   {Faker::Time.between(2.days.ago,Time.now,:midnight)}
    association :category, factory: :category
  end

end
