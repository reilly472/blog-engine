class UsersController < ApplicationController
    before_filter :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def index 
        @users = User.all
    end
    
    def show
    end
    
    def new
        @user = User.new
    end
    
    def create 
        @user = User.new(user_params)
        
        if @user.save
           flash[:notice] = "User created"
           redirect_to users_path
        else
            redirect_to users_path
        end
    end
    
    def edit 
    end
    
    def update 
        if params[:user][:password].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
        end
        
        if @user.update(user_params)
            flash[:notice] = "User updated"
            render :edit
        else
            render :edit
        end
    end
    
    def destroy 
        if @user != current_user
            @user.destroy
            flash[:notice] = "User deleted"
            redirect_to root_path
        else
            flash[:error] = "You can't delete your self"
            redirect_to root_path 
        end
    end
    
    private
    
    def set_user 
        @user = User.find(params[:id])
    end
    
    def user_params 
        params.require(:user).permit(:email, :password, :password_confirmation, product_ids: [])
    end
end