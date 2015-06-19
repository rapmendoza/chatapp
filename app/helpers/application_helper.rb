module ApplicationHelper
  def flash_type_to_bootstrap(flash_type)
    case flash_type
    when "error"
      "danger"
    else
      "success"
    end
  end
end
