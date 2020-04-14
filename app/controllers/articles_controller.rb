class ArticlesController < ApplicationController
  def create
    @article = current_user.articles.build(article_params)
    @article.save
  end
  
  
 def new
   @article = Article.new
  end


 
 private
 def article_params
   params.require(:article).permit(:title, :body, :user_id)
 end
 
end
