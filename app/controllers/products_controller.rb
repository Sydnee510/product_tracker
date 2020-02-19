class ProductsController < ApplicationController
    #before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    def index 
        @products = Product.all 
    end 
    def show 
        @product = Product.find(params[:id])
    end 
    def new 
        @product = Product.new
    end 
    def edit 
        @product = Product.find(params[:id])
    end 
    def create 
        @product = Product.new(product_params)

        # @product.save 
        # redirect_to @product
        if  @product.save 
       #@product.valid?
            redirect_to products_path, notice: "Product Successfully Created"
        else 
            render 'new'
        end 
    end 
    def destroy 
        @product = Product.find(params[:id]).destroy
        redirect_to products_path
    end 
    def update 
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to product_path(@product), notice: "product Successfully Updated" 
        else 
            render :edit 
        end
    end

    private 
    def product_params
        params.require(:product).permit(:name, :description, :price, :user_id, :category_id)
    end 
end
