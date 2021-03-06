class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to sub_url(@post.sub)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    # how to set sub_id? to @post
    # params[:id] equals to sub_id?
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to sub_url(@post.sub)
    else
      render :edit
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end

end
