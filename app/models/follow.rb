class Follow < ApplicationRecord
  validates :to_user_id, uniqueness: { scope: :from_user_id, message: "すでにフォローしています" }

  belongs_to :to_user, class_name: "User"
  belongs_to :from_user, class_name: "User"
end
