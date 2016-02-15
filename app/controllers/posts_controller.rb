# Post controller
class PostsController < ApplicationController
  before_action :current_post,
                only: [:show, :edit, :update, :destroy, :favourite]
  before_action :require_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

  def new
    redirect_to root_path unless current_user
    @post = Post.new
    @category = Category.all
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post.increment!(:page_views)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def favourite
    current_user.favourite_posts.manage(@post)
    redirect_to :back
  end

  private

  def current_post
    @post = Post.find(params[:id])
    if params[:category_id]
      @category = Category.find params[:category_id]
      @posts = @category.posts
    else
      @posts = Post.all
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :image, category_ids: [])
    # params.require(:post).permit!
  end

  def require_user
    redirect_to root_path unless current_user == @post.user
  end
end
