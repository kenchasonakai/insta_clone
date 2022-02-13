class Post < ApplicationRecord
  has_one_attached :image

  validates :image, presence: true
  validates :caption, length: { maximum: 191 }
end