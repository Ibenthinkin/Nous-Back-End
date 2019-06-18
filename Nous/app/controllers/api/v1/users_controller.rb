class Api::V1::UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def destroy
   @user.delete
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def show
    @user = User.find(params[:id])
    render json: @user, status: :accepted
  end


  def new
    @user = User.new
  end

  private

  def user_params
    params.permit(:first, :last, :email, :keywords, :sources, :exclusions)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
