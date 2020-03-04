class ProductsController < ApplicationController
    #before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    def index 
        if params[:search]
           
                @products = Product.searched(params[:search])
            else
                @products = Product.all.order(:category_id) 
        end 
        
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
        if  @product.save 
            redirect_to product_path(@product), notice: "Product Successfully Created"
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
    def expensive 
        @products = Product.expensive
    end

    private 
    def product_params
        params.require(:product).permit(:name, :description, :price, :user_id, :category_id, category_attributes: [:title])
    end 
end
