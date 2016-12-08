class ImagesController < ApplicationController
   before_filter :authenticate_user!, except: [:show]
   before_action :require_moderator, except: [:show]
   
   before_action :set_image, only: [:destroy, :show, :edit, :update]

   def index
       @images = Image.all
   end
   
   def show
      redirect_to @image.images[0].url
   end
   
   def new
       @image = Image.new
   end
   
   def create
       @image = Image.new(image_params)
       
       if @image.save
           flash[:notice] = "Image Saved"
           redirect_to images_path
       else
           render :new
       end
   end
   
   def edit
   end
   
   def update
      if @image.update(image_params)
         flash[:notice] = "Image updated"
         render :edit
      else
         render :edit
      end
   end
   
   def destroy
      @image.remove_images!
      #@image.thumb.remove! # if you have thumb version or any other version
      
      @image.destroy
      flash[:notice] = "Image deleted"
      redirect_to images_path
   end
   
   private
   
   def set_image
        @image = Image.friendly.find(params[:id]) 
    end
   
   def image_params
        params.require(:image).permit(:name, :slug, {images: []})
   end
end