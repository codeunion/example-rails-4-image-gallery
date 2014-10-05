module ApplicationHelper
  def nav_partial
    if user_signed_in?
      "shared/signed_in_nav"
    else
      "shared/signed_out_nav"
    end
  end
end
