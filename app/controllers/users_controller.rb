class UsersController < ApplicationController

  def show
    @user = User.find_by(username: params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id]=@user.id
    redirect_to root_url
  end
  
  
  def new
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:username, :password,
                                 :password_confirmation)
  end

end
