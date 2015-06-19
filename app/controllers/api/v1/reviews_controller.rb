class Api::V1::ReviewsController < Api::V1::ApiController

  def create
    unless item = Item.find_by_id(params[:item_id])
       render status: 404, json: { error: 'requested item does not exist' } and return
     end
     review = item.reviews.new(review_params)
     if review.save
       render json: review.as_json(except: [:updated_at, :item_id])
     else
       render status: 400, json: { errors: review.errors.full_messages }
     end
  end

  private
    def review_params
      params.require(:review).permit(:title, :body, :rating)
    end
end
