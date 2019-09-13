class ArticlesController < ApplicationController
  before_action :set_article, only: [:show,:edit,:update, :destroy]
  skip_before_action :authenticate_user!, only: [:index,:show]

  def index
    policy_scope(Article)
    if params[:query].present? # we call the hash params
      @query = params[:query]
      @articles = Article.where("title ILIKE ?", "%#{params[:query]}%")




    else
    @articles = policy_scope(Article).order(created_at: :desc)
    #authorize @articles
  end




  end


  def show

    #we have to initialize always the review on the controller where
    #we want to display it controller and action
    @review = Review.new



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
      create_pictures

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

    if @article.update(article_params)
      redirect_to @article, notice: "your article was update!"
    else
      render :edit
    end

   # redirect_to article_path(@article)

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

  def create_pictures
  images = params.dig(:article, :pictures) || []
  images.each do |image|
    @article.pictures.create(photo: image)
  end
end



end
