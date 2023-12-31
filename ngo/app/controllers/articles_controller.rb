class ArticlesController < ApplicationController
http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    @articles = Article.all
end
  
def edit
  @article = Article.find(params[:id])
end
  
  
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

def update
  @article = Article.find(params[:id])
  
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end

class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end
end