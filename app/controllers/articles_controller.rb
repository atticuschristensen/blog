class ArticlesController < ApplicationController
  def create
    @article = current_user.articles.build(article_params)
    @article.save
    redirect_to article_path(@article)
  end
  
  
 def new
   @article = Article.new
  end

 def show
   @article = Article.find(params[:id])
 end

 
 
 private
 def article_params
   params.require(:article).permit(:title, :body, :user_id)
 end
 
end
