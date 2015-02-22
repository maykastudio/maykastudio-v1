module ApplicationHelper
  def page_title
  end

  def carousel_active_class(index)
    if index == 0
      return 'active'
    else
      return 'stub'
    end
  end
end
