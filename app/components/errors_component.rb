# frozen_string_literal: true

class ErrorsComponent < ViewComponent::Base
  def initialize(object:)
    @object = object
  end
end
