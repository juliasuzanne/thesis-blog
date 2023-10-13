class PostsController < ApplicationController
  def index
    @posts = Post.all
    render template: "posts/index"
  end

  def show
    @post = Post.find_by(id: params[:id])
    render template: "posts/show"
  end

  def create
    post = Post.create(
      post_header: params[:post_header],
      posted_date: params[:posted_date],
    )
    if post.save
      render json: post.as_json
    else
      render json: { errors: post.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    post = Post.find_by(id: params[:id])
    post[:post_header] = params[:post_header] || post[:post_header]
    post[:posted_date] = params[:posted_date] || post[:posted_date]
    render json: post.as_json
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end
end
