class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.order(updated_at: :desc).paginate(page: params[:page], per_page: 5)
  end


  def show 
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end

  def create 
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else 
      flash[:alert] = "Article created failed"
      render :new
    end
  end

  def update 
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else 
      flash[:alert] = "Article updated failed"
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end