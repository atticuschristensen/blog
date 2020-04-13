module SessionsHelper

  #  def sign_in(user)
  #   #remember_token = User.new_remember_token
  #   #cookies.permanent[:remember_token] = remember_token
  #   #user.update_attribute(:remember_token, User.digest(remember_token))
  #   self.current_user = user
  # end


   # def current_user= (user)
   #    @current_user = user
   # end
  

 # def current_user
   # @current_user ||= User.find_by(username: "conrad")
  #end

  def logged_in?(user)
    user!=nil
  end

  
  def current_user
    if session[:user_id]
      @current_user ||=User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  
end

