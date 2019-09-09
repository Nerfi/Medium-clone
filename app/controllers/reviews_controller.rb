class ReviewsController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @review = Review.new

  end

  def create
    @review = Review.new(review_params)
    @article = Article.find(params[:article_id])
    @review.article = @article
    @review.save

    redirect_to article_path(@article)

  end


  private

  def review_params
    params.require(:review).permit(:content)

  end
end
