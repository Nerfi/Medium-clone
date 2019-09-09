class ArticlesController < ApplicationController
  before_action :set_article, only: [:show,:edit,:update, :destroy]
  skip_before_action :authenticate_user!, only: [:index,:show]

  def index
    #raise



    if params[:query].present? # we call the hash params
      @query = params[:query]
      @articles = Article.where("title LIKE '%#{params[:query]}%'")
      #authorize @articles
      #authorize [:articles,:title,:query]


    else
    @articles = policy_scope(Article).order(created_at: :desc)
    #authorize @articles
  end



  end


  def show


  end

  def new
    @article = current_user.articles.new
    authorize  @article

  end

  def create

    @article = Article.new(article_params)

    @article.user = current_user
    authorize @article

    if @article.save
      redirect_to articles_path(@articles), notice: 'article was created'

    else
      render :new

    end


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
    params.require(:article).permit(:title,:description,:photo)

  end

  def set_article
   authorize @article = Article.find(params[:id])

  end

end
