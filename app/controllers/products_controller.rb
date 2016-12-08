class ProductsController < ApplicationController
    before_filter :authenticate_user!
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    
    def index
        @products = Product.all
    end
    
    def show 
        
    end
    
    def new
        @product = Product.new
    end
    
    def create 
        @product = Product.new(product_params)
        
        if @product.save
           flash[:notice] = "Product created"
           redirect_to products_path
        else
            render :new
        end
    end
    
    def edit 
    end
    
    def update
        if @product.update(product_params)
            flash[:notice] = "Product updated"
            render :edit
        else
            render :edit
        end
    end
    
    def destroy 
        @product.destroy
        flash[:notice] = "Product deleted"
        redirect_to root_path
    end
    
    private
    
    def product_params
        params.require(:product).permit(:name)
    end
    
    def set_product
        @product = Product.find(params[:id])
    end
end