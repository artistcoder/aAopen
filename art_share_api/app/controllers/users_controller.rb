class UsersController < ApplicationController
    protect_from_forgery prepend: true
    
    def index
        case
        when params[:query]
            users = User.where('username LIKE ?', "%#{params[:query]}%")        
        else
            @users = User.all
        end

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
        params.require(:user).permit(:username)
    end


end
