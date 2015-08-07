# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Menu.destroy_all
Category.destroy_all

first_category = Category.create!(name: 'First')
main_category = Category.create!(name: 'Main')
drink_category = Category.create!(name: 'Drink')

Menu.create!([
{
title: "Potatoes",
description: "Deliciues. Try it!",
image_url: "images.jpeg",
price: "25" ,
category: first_category,
created_at: "2015-07-31 09:26:20",
published_on: "2015-07-02 09:26:20"
},
{
title: "Eggs & meat",
description: "Very good!",
image_url: "eggs.jpeg",
price: "15" ,
category: first_category,
created_at: "2015-08-01 09:26:20",
published_on: "2015-07-02 09:26:20"
},
{
title: "Ukrainian borsch",
description: "Deliciues. Try it!",
image_url: "images.jpeg",
price: "15" ,
category: first_category,
created_at: "2015-08-02 09:26:20",
published_on: "2015-07-03 09:26:20"
},
{
title: "Macarons & fish",
description: "Fish is very nice and fresh",
image_url: "index.jpeg",
price: "30" ,
category: main_category,
created_at: "2015-08-02 09:26:20",
published_on: "2015-07-04 09:26:20"
},
{
title: "Potato with fish",
description: "Fish is very nice and fresh",
image_url: "images.jpeg",
price: "20" ,
category: main_category,
created_at: "2015-08-01 09:26:20",
published_on: "2015-07-05 09:26:20"
},
{
title: "Tamova Vodka",
description: "Russian one.",
image_url: "vodka.jpg",
price: "2" ,
category: drink_category,
created_at: "2015-07-31 09:26:20",
published_on: "2015-07-02 09:26:20"
},
{
title: "Bellucci Liqueur",
description: "40 degrees.uuuuuhh.",
image_url: "belluchi.jpg",
price: "30" ,
category: drink_category,
created_at: "2015-07-31 09:26:20",
published_on: "2015-07-03 09:26:20"
},
{
title: "Green Tea",
description: "Nice One!",
image_url: "green_tea.jpeg",
price: "10" ,
category: drink_category,
created_at: "2015-07-31 09:26:20",
published_on: "2015-07-01 09:26:20"
}
])
