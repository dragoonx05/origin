class UsersController < Clearance::UsersController

  def edit
    @user = User.find(params[:id])

  end
  
  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.avatar = params[:file]
    user.update(params_update_user)
    user.save
    redirect_to user_path(user)
  end

    private
    def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.first_name = first_name
      user.last_name = last_name
    end
  end

  def params_update_user
    params.require(:users).permit(:role, :avatar)
  end

end
