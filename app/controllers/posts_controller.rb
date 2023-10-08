class PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts.as_json
  end

  def show
    @post = Post.find_by(id: params[:id])
    render template: "posts/show"

  end

  def create
    post = Post.new(
      header: params[:header],
      date: params[:date],
      
    )
    if post.save

    render json: post.as_json
      
    else
      render json: {errors: post.errors.full_messages},
      status :unprocessable_entity
    end
      
    end

    def update
      post = Post.find_by(id: params{:id})

      post[:header] = params[:header] || post[:header]
      post[:date] = params[:date] || post[:date]
     
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
    end

end
