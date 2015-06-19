class Item < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, dependent: :destroy

  def average_rating
    ratings = self.reviews.map { |review| review.rating }
    return ratings.reduce(:+) / ratings.length
  end

  def latest_review
    return self.reviews.order(:created_at).last.body
  end
end
