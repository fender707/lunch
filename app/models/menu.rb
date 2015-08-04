class Menu < ActiveRecord::Base
  
  belongs_to :category
  has_many :line_items
  has_many :orders, through: :line_items  


  validates_presence_of :title, :price, :description, :published_on
  validates :title, length: { in: 3..50}, uniqueness: true
  validates :description, length: {maximum: 500}

  def self.filter(category_id)
    where('menus.category_id= ?', category_id)
  end

  def self.time_ago(count)
    count_int = count.to_i
    date = Date.parse(count_int.days.ago.to_s)
    if count.to_i < 5
      where(created_at: date..date.end_of_day)
    else
      where(created_at: 5.days.ago..30.days.ago)
    end
  end

end
