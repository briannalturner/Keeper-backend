class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.new(user_params)
        user.password = params[:password]
        if user.valid?
            user.save
            render json: user
        else
            render json: {message: "invalid user", errors: user.errors}
        end

    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :bio, :year, :gender, :orientation, :birthdate, :likes_women, :likes_men, :likes_other, :asexual, :house, :favorite_spell, :image, :username)
    end
end
