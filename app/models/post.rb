class Post < ApplicationRecord
  has_one_attached :image

  validates :image, presence: true
  validates :caption, length: { maximum: 191 }

  belongs_to :user
  has_many :likes, dependent: :destroy

  scope :followed_by, -> (user){ where(user_id: user.following_ids.push(user.id)) }
end
