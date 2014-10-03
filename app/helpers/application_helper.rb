module ApplicationHelper
  #Returns the full title on a per-page basis
  # @param [String, #read] the page title from the page
  # @return [String] The full title
  def full_title(page_title = '')
    base_title = "Admission"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def is_admin?
    true if current_user.level == admin_level
  end
  # to return Level of user to determine he is verifier or not
  def is_verifier?
    true if current_user.level == verifier_level
  end
  # to return Level of user to determine he is registered or not
  def current_user_level
    current_user.level
  end
  # if the level is set to 5 the user is admin
  def admin_level
    1
  end
  # if the level is set to 6 the user is verifier
  def verifier_level
    2
  end
  # to determine the user is signed in and is admin if not sends back to root
  def admin_signin_status
    unless user_signed_in? && is_admin?
      redirect_to root_url
    end
  end
  # to determine the user is signed in and is verfier if not sends back to root
  def verfier_signin_status
    unless user_signed_in? && is_verifier?
      redirect_to root_url
    end
  end
  # to determine the user is signed in if not sends back to root
  def user_signin_status
    unless user_signed_in?
      redirect_to root_url
    end
  end
end
