class ReviewsController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @review = Review.new

  end

  def create
    @review = Review.new(review_params)
    @article = Article.find(params[:article_id])
    @review.article = @article

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


  private

  def review_params
    params.require(:review).permit(:content)

  end
end
