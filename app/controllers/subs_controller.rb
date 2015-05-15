class SubsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :ensure_subs_moderator, only: :edit

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    unless @sub.save
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    else
      redirect_to sub_url(@sub)
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def ensure_subs_moderator
    @sub = Sub.find(params[:id])
    unless current_user.id == @sub.moderator_id
      flash[:errors] = ["Can only edit your own subforum"]
      redirect_to sub_url(@sub)
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
  end

  private

    def sub_params
      params.require(:sub).permit(:title, :description)
    end
end
