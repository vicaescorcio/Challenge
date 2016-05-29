class UsersController < ApplicationController
   before_action :logged_in_user, only: [:edit, :update]
   before_action :correct_user,   only: [:edit, :update]
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
     @solicitation = current_user.solicitations.build
     @solicitations = @user.solicitations
     @reuse = current_user.reuses.build
     @reuses = @user.reuses
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
    	flash[:success] = "Bem-vindo ao Papelada!"
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :register, :password,
                                   :password_confirmation)
    end
    def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Perfil atualizado!"
      redirect_to @user

      # Handle a successful update.
    else
      render 'edit'
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Faça o login in antes."
        redirect_to login_url
      end
    end

end
