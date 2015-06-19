class Api::V1::CategoriesController < Api::V1::ApiController

  def index
    render json: Category.all.as_json(except: [:created_at, :updated_at])
  end

  def show
    if category = Category.find_by_id(params[:id])
      render json: category.as_json(
        except: [:created_at, :updated_at],
        include: {
         items: { except: [:created_at, :updated_at, :category_id] }
        }
      )
    else
      render status: 404, json: {
        error: 'requested category does not exist'
      }
    end
  end
end
