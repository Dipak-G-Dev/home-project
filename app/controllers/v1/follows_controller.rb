class V1::FollowsController < ApplicationController
  before_action :find_user, only: [:followers, :followees , :destroy]

  def followers
    friends  = Follow.where(follower_id: @user.id).map(&:followers)
    render json: friends
  end

  def followees
    friends = @user.followees
    render json: {followees: friends}
  end

  def create
    follow = Follow.new(follow_params)
    if follow.save
      render json: {message: "#{follow_params[:follower_id]} is now following #{follow_params[:followee_id]}"}, status: :created
    else
      render json: { errors: follow.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    follow = @user.follows.find_by(followee_id: params[:followee_id])
    if follow&.destroy
      render json: {deleted: " You have Unfollowed Successfully"}
    else
      render json: { errors: "You don't follow that user" }, status: :unprocessable_entity
    end
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def follow_params
    params.require(:follow).permit(:followee_id , :follower_id)
  end
end
