class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :view_counts, dependent: :destroy
  
  validates :body ,presence: true,
  length: { minimum: 1, maximum: 200 }
  validates :title ,presence: true,
    length: { minimum: 1, maximum: 20 }
    
   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
   end

def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
end
  
end

