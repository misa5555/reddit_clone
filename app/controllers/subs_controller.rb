class SubsController < ApplicationController
  #prohibit non-moderators from editing or updating the Sub.
  before_action :require_moderator_login!, only: [:edit, :update]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = current_user.subs.find(params[:id])
    render :edit
  end

  def update
    @sub = current_user.subs.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_moderator_login!
    @sub = Sub.find(params[:id])
    return if @sub.moderator_id == current_user.id
    redirect_to sub_url(@sub)
  end
end
