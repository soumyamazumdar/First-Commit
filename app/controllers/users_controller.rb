class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
  # before_action :already_login

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
  	@user = User.new(users_params)
    
    if @user.save
      log_in(@user)
      redirect_to welcome_index_path,notice: "thank you!"
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(users_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end
  
  private
    def users_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
