module SessionsHelper

  def current_user
    hashed_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: hashed_token)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    user == current_user
  end

  def log_in(user)
    # Create a new rem
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

  def log_out
    # Overwrite remember token in DB with a new, random one
    # Delete remember token from cookies
    # Forget current user

    self.current_user.update_attribute(:remember_token, 
                                       User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    unless logged_in?
      flash[:warning] = "Please log in."
      redirect_to login_url
    end
  end

end
