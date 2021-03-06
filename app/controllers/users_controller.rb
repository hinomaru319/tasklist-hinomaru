class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザーの登録に成功しました"
      redirect_to "/"
    else
      flash.now[:danger] = "ユーザーの登録に失敗しました"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
