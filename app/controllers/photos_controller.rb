class PhotosController < ApplicationController
  def index
    photos = Photo.all
    render json: photos.as_json
  end

  def show
    @photos = Photo.where(post_id: params[:id])
    render json: @photos.as_json
  end

  def create
    photo = Photo.create(
      url: params[:url],
      name: params[:name],
      abovewriting: params[:abovewriting],
      belowwriting: params[:belowwriting],
      post_id: params[:post_id],
    )
    if photo.save
      render json: photo.as_json
    else
      render json: { errors: photo.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    photo = Photo.find_by(id: params[:id])

    photo.update(
      post_id: params[:post_id] || photo.post_id,
      url: params[:url] || photo.url,
      name: params[:name] || photo.name,
      abovewriting: params[:abovewriting] || photo.abovewriting,
      belowwriting: params[:belowwriting] || photo.belowwriting,
    )
    render json: photo.as_json
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
  end
end
