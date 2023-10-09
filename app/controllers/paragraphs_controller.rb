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
    paragraph = Paragraph.create(
      writing: params[:writing],
      post_id: params[:post_id],
    )
    if paragraph.save
      render json: paragraph.as_json
    else
      render json: { errors: paragraph.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    paragraph = Paragraph.find(params { :id })

    paragraph[:post_id] = params[:post_id] || paragraph[:post_id]
    paragraph[:writing] = params[:writing] || paragraph[:writing]
  end

  def destroy
    paragraph = Paragraph.find(params[:id])
    paragraph.destroy
  end
end
