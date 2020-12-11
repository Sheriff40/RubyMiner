class UsersController < DashboardBaseController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def create
    @user = User.create user_params
    if @user.persisted?
      flash[:notice] = "User successfully created."
      redirect_to users_path
    else
      flash[:error] = "Error while creating user."
      redirect_back(fallback_location: root_path)
    end
  end

  # update profile from profile page
  def update
    @user = User.find_by_id(params[:id])
    if @user.update user_params
      flash[:notice] = "User was updated"
      redirect_to users_path
    else
      flash[:error] = "Could not update user"
      redirect_back(fallback_location: root_path)
    end
  end

  def assign_role
    @user = User.find_by_id(params[:id])
  end

  def update_role
    @user = User.find_by_id(params[:id])
    if @user.update(assign_role_params)
      flash[:notice] = 'Role successfully assigned.'
    else
      flash[:error] = 'Error while assigning roles.'
    end
    redirect_to users_path
  end

  private

  # for normal data update
  # for super admin and god admin user update
  # from profile page
  def user_params
    params.require(:user).permit(:email)
  end

  # assign role to user
  def assign_role_params
    params.require(:user).permit(role_ids: [])
  end

end
