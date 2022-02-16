class User < ApplicationRecord
  HALF_WIDTH_ALPHANUMERIC_CHARACTERS_REGEX = /\A[a-zA-Z0-9]+\z/
  authenticates_with_sorcery!
  has_one_attached :icon

  validates :email, presence: true
  validates :username, presence: true, format: { with: HALF_WIDTH_ALPHANUMERIC_CHARACTERS_REGEX, message: "半角英数字のみ使えます" }
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :introduction, length: { maximum: 191 }

  has_many :posts, dependent: :destroy
end
