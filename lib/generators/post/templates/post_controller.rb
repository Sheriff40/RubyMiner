class PostsController < DashboardBaseController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
    render layout: "application"
  end

  # GET /posts/1
  def show
    @post = Post.find_by_id(params[:id])
    @comment = @post.comments.new
    user_post = UserPostLike.where(post_id: @post.id )
    @user_post_like = current_user.nil? ? nil : UserPostLike.where(user_id: current_user.id, post_id: @post.id ).first
    @likes = user_post.count
    render layout: "application"
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to posts_path
    else
      flash[:alert] = 'Post could not be created.'
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      flash[:notice] =  'Post was successfully updated.'
      redirect_to @post
    else
      flash[:alert] =  'Post could not be updated.'
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    if @post.destroy
      flash[:notice] =  'Post was successfully destroyed.'
    else
      flash[:alert] = "Post could not be deleted"
    end
    redirect_to posts_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = current_user.posts.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :summary, :body, :tags)
  end
end
