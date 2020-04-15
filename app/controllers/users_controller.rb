class UsersController < ApplicationController

  def show
    @user = User.find_by(username: params[:username])
    @articles = @user.articles.reorder("updated_at DESC").paginate(page: params[:page], per_page: 5)
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id]=@user.id
      redirect_to root_url
    else
      render 'new'
    end
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
