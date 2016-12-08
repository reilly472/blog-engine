class ProductsController < ApplicationController
    before_filter :authenticate_user!
    before_action :require_moderator, except: [:buy]
    
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    
    def index
        @products = Product.all
    end
    
    def show 
        
    end
    
    def buy
        @product = Product.friendly.find(params[:product_id])
        
        if !current_user.products.include?(@product)
            current_user.products << @product
            flash[:notice] = "Producted Purchased!"
        else
            flash[:error] = "You already have this product!"
        end
        
        redirect_to products_path
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
        params.require(:product).permit(:slug, :name, download_ids: [])
    end
    
    def set_product
        @product = Product.friendly.find(params[:id])
    end
end