class PostsController < ApplicationController
  before_action :ensure_posts_author, only: [:edit, :update]

  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end

  def create
    @subs = Sub.all
    @post = Post.new(post_params)
    @post.author = current_user
    # fail
    unless @post.save
      flash.now[:errors] = @post.errors.full_messages
      render :new
    else
      redirect_to post_url(@post)
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def ensure_posts_author
    @post = Post.find(params[:id])
    unless current_user.id == @post.author_id
      flash[:errors] = ["Can only edit your own post!"]
      redirect_to sub_url(@post.sub)
    end
  end

  def edit
    @post = Post.find(params[:id])
    @subs = Sub.all
  end

  def update
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :url, sub_ids: [])
    end
end
