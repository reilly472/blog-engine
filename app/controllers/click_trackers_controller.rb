class ClickTrackersController < ApplicationController
    before_filter :authenticate_user!, except: [:show]
    before_action :require_moderator, except: [:show]
    
    before_action :set_click_tracker, only: [:show, :edit, :update, :destroy]
    
    def index
        @click_trackers = ClickTracker.all
    end
    
    def show
        redirect_to fix_url(@click_tracker.url)
    end
    
    def new
        @click_tracker = ClickTracker.new
    end
    
    def create
        @click_tracker = ClickTracker.new(click_tracker_params)
        
        if @click_tracker.save
            flash[:notice] = "Click Tracker Created"
            redirect_to click_trackers_path
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @click_tracker.update(click_tracker_params)
            flash[:notice] = "Click Tracker Updated"
            render :edit
        else
            render :edit
        end
    end
    
    def destroy
        @click_tracker.destroy
        flash[:notice] = "Click Tracker deleted"
        redirect_to root_path
    end
    
    private
    
    def set_click_tracker
        @click_tracker = ClickTracker.friendly.find(params[:id]) 
    end
    
    def click_tracker_params
        params.require(:click_tracker).permit(:name, :url, :slug) 
    end
end