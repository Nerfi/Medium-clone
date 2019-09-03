class ArticlesController < ApplicationController
  before_action :set_article, only: [:show,:edit,:update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @articles = Article.all

  end


  def show
    #@article = Article.find(params[:id])

  end

  def new
    @article = Article.new

  end

  def create

    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path(@articles)
    else
      render :new
    end
    @article.errors

  end

  def edit
    #@article = Article.find(params[:id])

  end

  def update
   # @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)

  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path

  end

  private

  def article_params
    params.require(:article).permit(:title,:description)

  end

  def set_article
    @article = Article.find(params[:id])

  end

end
