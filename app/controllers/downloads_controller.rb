class DownloadsController < ApplicationController
    before_filter :authenticate_user!, except: [:show]
    before_action :require_moderator, except: [:show]
    
    before_action :set_download, only: [:destroy, :show, :edit, :update]
    
    def index
        @downloads = Download.all
    end
    
    def show 
        redirect_to @download.downloads[0].url
    end
    
    def new
        @download = Download.new
    end
    
    def create 
        @download = Download.new(download_params)
        
        if @download.save
            flash[:notice] = "Download saved"
            redirect_to downloads_path
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @download.update(download_params)
            flash[:notice] = "File Updated"
            render :edit
        else
            render :edit
        end
    end
    
    def destroy
        @download.remove_downloads!
        
        @download.destroy
        flash[:notice] = "Download file deleted"
        redirect_to downloads_path
    end
    
    private
    
    def set_download
        @download = Download.friendly.find(params[:id])
    end
    
    def download_params
        params.require(:download).permit(:name, :slug, {downloads: []})
    end
end