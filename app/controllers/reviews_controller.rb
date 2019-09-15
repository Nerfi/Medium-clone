class ReviewsController < ApplicationController
before_action :set_article, only: [:edit,:update, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @review = Review.new(review_params)
    @review.article = @article
      authorize @article


      if @review.save
        respond_to do |format|
          format.html { redirect_to article_path(@article) }
          format.js  # <-- will render `app/views/reviews/create.js.erb`
        end


    else
      respond_to do |format|
      format.html {render 'articles/show'}
      format.js
      end

    end

  end


  #def ski_pundit?
    #return true if params[:action] == 'create'
   # super #fallback to the original method

  #end


  private

  def review_params
    params.require(:review).permit(:content)

  end
  def set_article
    @article = Article.find(params[:id])
    authorize @article


  end
end
