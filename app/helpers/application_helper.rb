module ApplicationHelper
#***************************************************************************#
#   Created by : Sourav Moitra                                              #
#   email : astrosourav@gmail.com                                           #
#   License : The MIT License (MIT)                                         #
#   Date : October 5th 2014                                                 #
#***************************************************************************#
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

  # to return Level of user to determine he is verifier or not
  def is_verifier?
    true if current_user.verifier == true
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
      flash[:danger] = "you need to register yourself or sign in"
      redirect_to sign_in_path
    end
  end
end
