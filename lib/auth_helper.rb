module AuthHelper
  def user_sign_in(user)
    session[:user_id] = user.id
  end

  def user_signed_in?
    session[:user_id] && User.find_by_id(session[:user_id])
  end

  def user_sign_out
    session[:user_id] = nil
  end

  def authenticate_user?(user, password)
    user.password === password
  end

  def authenticate_user!
    redirect_to new_session_path unless user_signed_in?
  end

  def current_user
    User.find session[:user_id]
  end

  #Searcher

  def searcher_signed_in?
    Searcher.find_by_user_id session[:user_id]
  end

  def current_searcher
    Searcher.find_by_user_id session[:user_id] if searcher_signed_in?
  end

end
