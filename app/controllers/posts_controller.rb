class PostsController < ApplicationController
    before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    def index
        @posts = Post.all
    end
    
    def show
        
    end
    
    def new
        @post = Post.new
    end
    
    def create 
        @post = Post.new(post_params) 
        
        if @post.save
            flash[:notice] = "Post created" 
            redirect_to posts_path
        else
            render :new
        end
    end
    
    def edit; end
    
    def update
        if @post.update(post_params)
            flash[:notice] = "Post updated"
            render :edit
        else
            render :edit
        end
    end
    
    def destroy
        @post.destroy
        flash[:notice] = "Post deleted"
        redirect_to root_path
    end
    
    private
    
    def set_post
        begin
            @post = Post.friendly.find(params[:id]) 
        rescue ActiveRecord::RecordNotFound => e
            raise ActionController::RoutingError.new('Not Found')
        end
    end
    
    def post_params
        params.require(:post).permit(:title, :body, :slug)
    end
end