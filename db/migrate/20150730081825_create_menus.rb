class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.integer :category_id
      t.string :image_url
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
