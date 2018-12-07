class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
        
    end

    def create
        @user = User.create(user_params)

        if @user.valid?
            log_in @user
            redirect_to @user
        else
            flash[:errors] = @user.errors.messages #this will give you the error hash with keys
            redirect_to new_user_path
        end
    end

    def show
      @answered_questions = @user.answered_questions
    end

    def edit
    end

    def update
        @user.update(user_params)

        redirect_to @user
    end

    def destroy

        @user.destroy

        redirect_to new_user_path
    end

    private
    def find_user
        @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:name, :username, :password, :approachability_rating, :image, :experience_level, :uid, :provider, :email)
    end
end
