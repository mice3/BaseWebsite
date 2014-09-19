module ApplicationHelper

  def money_sum_gross(current, object)
    if object
      object = object.gross
    else
      object = 0
    end
    return current + (object * 3)
  end

  def money_sum_net(current, object)
    if object
      object = object.net
    else
      object = 0
    end
    return current + (object * 3)
  end

end
