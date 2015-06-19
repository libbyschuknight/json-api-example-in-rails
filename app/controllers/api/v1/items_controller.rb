class Api::V1::ItemsController < Api::V1::ApiController

  def index
    render json: Item.all.as_json(
      except: [:created_at, :updated_at, :category_id],
      methods: [:average_rating, :latest_review],
      include: {
        category: { only: [:id, :title] }
      }
    )
  end

  def show
    if item = Item.find_by_id(params[:id])
      render json: item.as_json(
        except: [:created_at, :updated_at, :category_id],
        methods: [:average_rating],
        include: {
          category: { only: [:id, :title] },
          reviews: { except: [:updated_at, :item_id] }
        }
      )
    else
      render status: 404, json: { error: 'requested item does not exist' }
    end
  end
end
