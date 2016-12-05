class ImagesController < ApplicationController
   before_filter :authenticate_user!, except: [:show]

   def index
       @images = Image.all
   end
   
   def show
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
   end
   
   def destroy
   end
   
   private
   
   def set_image
        @image = Image.find(params[:id]) 
    end
   
   def image_params
        params.require(:image).permit(:name, {images: []})
   end
end