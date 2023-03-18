class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  
  validates :body ,presence: true,
  length: { minimum: 1, maximum: 200 }
  validates :title ,presence: true,
    length: { minimum: 1, maximum: 20 }
    
   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
   end
end

