class CategoriesController < ProductsController
    before_action :authenticate_user!
    def index 
        if params[:search]
            @categories = Category.search_category(params[:search])
        else
            @categories = Category.all.order(:title) 
    end 
end
    def show 
        @category = Category.find(params[:id])
    end 
    def new 
        @category = Category.new
    end 
    def edit 
        @category = Category.find(params[:id])
    end 
    def create 
        @category = Category.new(category_params)
        if  @category.save 
            redirect_to categories_path, notice: "Category Successfully Created"
        else 
            render 'new'
        end 
    end 
    def update 
        @category = Category.find(params[:id])
        if @category.update(category_params)
            redirect_to category_path(@category), notice: "category Successfully Updated" 
        else 
            render :edit 
        end
    end
    def destroy 
        @category = Category.find(params[:id]).destroy
        redirect_to categories_path
    end 
    private 
    def category_params
        params.require(:category).permit(:title, products_attributes: [:name] )
    end 
end

