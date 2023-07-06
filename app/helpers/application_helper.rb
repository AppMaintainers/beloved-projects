module ApplicationHelper
  def bootstrap_class_for_toast(type)
    case type
    when 'alert'
      'text-bg-danger'
    when 'success', 'notice'
      'text-bg-success'
    else
      'text-bg-warning'
    end
  end
end
