class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        user = User.new(user_params)
         # replace the `user_attributes_here` with the actual attribute keys
         if user.save
            render json: user
          else
            render json: user.errors.full_messages, status: :unprocessable_entity
          end

    end

    def show
        user = User.find_by(id: params[:id])
       
        render json: user

    end

    def update
        user = User.find_by(id: params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user.destroy
            render json: user
        else
            render json: "Not possible to delete this user"
        end
    end



    private

    def user_params
        params.require(:user).permit(:name, :email)
    end


end