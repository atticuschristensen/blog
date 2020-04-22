module SessionsHelper
  def logged_in?(user)
    user != nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def valid_user
    @article = current_user.articles.find(params[:id])
  rescue StandardError
    redirect_to root_url
  end
end
