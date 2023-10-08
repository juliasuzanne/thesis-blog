class PhotosController < ApplicationController
  def index
    photos = Photo.all
    render json: photos.as_json
  end

  def show
    photo = Photo.where(post_id: params[:id])
  end

  def create
    photo = Photo.new(
      url: params[:url],
      name: params[:name],
      abovewriting: params[:abovewriting],
      belowwriting: params[:belowwriting],
      post_id: params[:post_id],
    )
    if photo.save

    render json: photo.as_json
      
    else
      render json: {errors:photo.errors.full_messages},
      status :unprocessable_entity
    end
      
    end

    def update
      photo = Photo.find(params{:id})

      photo[:url] = params[:url] || photo[:url]
      photo[:name] = params[:name] || photo[:name]
      photo[:abovewriting] = params[:abovewriting] || photo[:abovewriting]
      photo[:belowwriting] = params[:belowwriting] || photo[:belowwriting]
    end

    def destroy
      photo = Photo.find(params[:id])
      photo.destroy
    end

  
end
