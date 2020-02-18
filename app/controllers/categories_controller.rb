class CategoriesController < ProductsController
    before_action :authenticate_user!
    def index 
        @categories = Category.all 
        @products = Product.all
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

        # @category.save 
        # redirect_to @category
        if  @category.save 
       #@category.valid?
            redirect_to categories_path, notice: "Category Successfully Created"
        else 
            render 'new'
        end 
    end 
    def destroy 
        @category = Category.find(params[:id]).destroy
        redirect_to categories_path
    end 
    private 
    def category_params
        params.require(:category).permit(:title, :product_id)
    end 
end

