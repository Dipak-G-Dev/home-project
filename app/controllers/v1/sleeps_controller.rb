class V1::SleepsController < ApplicationController
  before_action :load_user, only: [:index, :friends_record]
  def index
    sleeps = @user.sleeps.by_desc_order
    render json: {sleeps: sleeps}
  end

  def create
    user = User.find(sleep_params[:user_id])
    sleep = user.sleeps.new(sleep_params)
    if sleep.save
      render json: { sleep: "you have clocked in successfully with duration #{sleep.duration.strftime("%H:%M:%S")}" } , status: :created
    else
      render json: { errors: sleep.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def friends_record
    friends = @user.followees
    sleeps = Sleep.by_user_id(friends).by_created_at.by_asc_order
    render json: {record: sleeps}
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def sleep_params
    params.require(:sleep).permit(:asleep_at, :woke_up_at, :user_id)
  end
end

