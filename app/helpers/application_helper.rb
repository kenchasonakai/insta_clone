module ApplicationHelper
  def flash_message
    if alert
      content_tag(:div, alert, class: "alert alert-danger")
    elsif notice
      content_tag(:div, notice, class: "alert alert-success")
    end
  end
end
