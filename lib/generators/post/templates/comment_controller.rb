class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_post, only: :create

  # POST /comments
  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
    else
      flash[:alert]= @comment.errors.messages
    end
    redirect_to post_path(@post)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:post_id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:description, :post_id, :parent_comment_id, :user_id)
  end
end
