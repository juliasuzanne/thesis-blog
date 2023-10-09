class ParagraphsController < ApplicationController
  def index
    paragraphs = Paragraph.all
    render json: paragraphs.as_json
  end

  def show
    @paragraphs = Paragraph.where(post_id: params[:id])
    render json: @paragraphs.as_json

  end

  def create
    paragraph = Paragraph.new(
      writing: params[:writing],
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
