class ArticlesController < ApplicationController
  before_action :valid_user, only: %i[update destroy]

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = 'Success! New post!'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = 'Article Updated'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'Article Deleted'
    redirect_to by_username_path(current_user.username)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :user_id)
  end
end
