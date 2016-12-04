class SnippetsController < ApplicationController
    before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_snippet, only: [:show, :edit, :update, :destroy]
    
    def index
        @snippets = Snippet.all
    end
    
    def show
        
    end
    
    def new
        @snippet = Snippet.new
    end
    
    def create 
        @snippet = Snippet.new(post_params) 
        
        if @snippet.save
            flash[:notice] = "Snippet created" 
            redirect_to snippets_path
        else
            render :new
        end
    end
    
    def edit; end
    
    def update
        if @snippet.update(post_params)
            flash[:notice] = "Snippet updated"
            render :edit
        else
            render :edit
        end
    end
    
    def destroy
        @snippet.destroy
        flash[:notice] = "Snippet deleted"
        redirect_to root_path
    end
    
    private
    
    def set_snippet
        @snippet = Snippet.find(params[:id]) 
    end
    
    def post_params
        params.require(:snippet).permit(:name, :body, :code)
    end
end