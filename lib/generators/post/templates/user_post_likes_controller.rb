class UserPostLikesController < ApplicationController
  def create
    @user_post_like = UserPostLike.where(user_id: params[:user_id], post_id: params[:post_id] ).first

    # If the user has not liked the post, allow them to like it
    if @user_post_like.nil?
      UserPostLike.create!(user_id: params[:user_id], post_id: params[:post_id])
      # If the user has already liked the post, allow them to unlike it
    else
      @user_post_like.destroy
    end

    # Calculate the total like count after the above operation has completes
    likes = UserPostLike.where(post_id: params[:post_id]).count
    post = Post.find_by_id(params[:post_id])
    post.update!(like_count: likes)

    render json: {likes: post.like_count }
  end
end
