class Menu < ActiveRecord::Base
  
  belongs_to :category
  has_many :line_items
  has_many :orders, through: :line_items  

  
  def self.filter(category_id)
    where('menus.category_id= ?', category_id)
  end

  def self.time_ago(count)
    if count.to_i < 5
      where('menus.created_at = ?', count.to_i.days.ago)
    else
      where('menus.created_at >= ?', count.to_i.days.ago)
    end
  end

end
