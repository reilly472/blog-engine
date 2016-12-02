class PostsController < ApplicationController
    before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
    before_action :set_post, only: [:show, :edit, :update]
    
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
            flash[:alert] = "Post not saved"
            render :new
        end
    end
    
    def edit; end
    
    def update
        if @post.update(post_params)
            flash[:notice] = "Post updated"
            redirect_to post_path(@post)
        else
            flash[:alert] = "Post not saved"
            render :edit
        end
    end
    
    private
    
    def set_post
        @post = Post.find(params[:id]) 
    end
    
    def post_params
        params.require(:post).permit(:title, :body)
    end
end