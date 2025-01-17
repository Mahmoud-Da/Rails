class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.order(updated_at: :desc)
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    # TODO: ログイン機能できる際に対応する
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article created Successfully"
    redirect_to @article
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated Successfully"
    redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end