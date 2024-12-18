class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authorize_user!, only: %i[ edit update destroy ]

  # GET /posts
  def index
    @posts = current_organization.posts.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Your post was successfully created."
    else
      flash.now[:alert] = "Your post could not be created. Please address any errors below."
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Your post was successfully updated.", status: :see_other
    else
      flash.now[:alert] = "Your post could not be updated. Please address any errors below."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, notice: "Your post was successfully deleted.", status: :see_other
  end

  private

    def set_post
      @post = Post.find(params.expect(:id))
    end

    def post_params
      params.expect(
        post: [ :title, :message, :user_id ]
      ).merge(
        user_id: current_user.id,
        organization_id: current_organization.id
      )
    end

    def authorize_user!
      return if @post.user == current_user

      redirect_to posts_path
    end
end
