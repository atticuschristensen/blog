class ArticlesController < ApplicationController
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Success! New post!"
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
   @article = Article.find(params[:id])
   if @article.update_attributes(article_params)
     flash[:success] = "Article Updated"
     redirect_to @article
   else
     render 'edit'
   end
 end
 
 
 private
 def article_params
   params.require(:article).permit(:title, :body, :user_id)
 end
 
end
