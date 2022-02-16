# frozen_string_literal: true

class MyPostComponent < ViewComponent::Base
  def initialize(my_post:)
    @my_post = my_post
  end
end
