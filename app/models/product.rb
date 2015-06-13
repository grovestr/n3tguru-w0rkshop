class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :reviews

  validates_presence_of :title
  validates_presence_of :description
  validates :price, :presence => true,
            :format =>  /\A\d+(?:\.\d{0,2})?\z/

  def average_rating
    reviews.average(:rating)
  end
end
