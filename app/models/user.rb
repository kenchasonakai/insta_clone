class User < ApplicationRecord
  HALF_WIDTH_ALPHANUMERIC_CHARACTERS_REGEX = /\A[a-zA-Z0-9]+\z/
  authenticates_with_sorcery!
  has_one_attached :icon

  validates :email, presence: true
  validates :username, presence: true, format: { with: HALF_WIDTH_ALPHANUMERIC_CHARACTERS_REGEX, message: "半角英数字のみ使えます" }
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :introduction, length: { maximum: 191 }

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follow_relationships, class_name: "Follow", foreign_key: :from_user_id, dependent: :destroy
  has_many :followed_relationships, class_name: "Follow", foreign_key: :to_user_id, dependent: :destroy
  has_many :followings, through: :follow_relationships, source: :to_user
  has_many :followers, through: :followed_relationships, source: :from_user
end
