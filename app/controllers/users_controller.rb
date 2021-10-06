class UsersController < ApplicationController
     skip_before_action :login_required, only: [:new, :create]
     before_action :set_user, only: [:update, :edit, :show]
     def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user.id)
        else
            render :new
        end
    end

    def edit
    end
  
    def update
      if @user.update(user_params)
        flash[:notice] = " Details utilisateur modifié avec succès" 
        redirect_to user_path
      else
        render :edit 
      end
    end
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_pic,  :profile_pic_cache)
    end

  def set_user
    @user = User.find(params[:id])
  end
end
