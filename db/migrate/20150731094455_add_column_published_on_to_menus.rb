class AddColumnPublishedOnToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :published_on, :date
  end
end
