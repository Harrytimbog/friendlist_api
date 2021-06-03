class Api::V1::FriendsController < ApplicationController
  before_action :set_friend, only: [ :show, :update, :destroy ]

  def index
    @friends = Friend.all
    render json: @friends
  end

  def show
    render json: @friend
  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      render json: @friend, status: :created, location: api_v1_friend_url(@friend)
    else
      render_error
    end
  end

  def update
    if @friend.update(friend_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @friend.destroy
    head :no_content
  end

  private

  def set_friend
    @friend = friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:name, :address, :nickname, :category, :description)
  end

  def render_error
    render json: { errors: @friend.errors.full_messages }, status: :unprocessable_entity
  end
end
