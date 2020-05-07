class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user, include: [:likees => {:only => [:id]}]
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

    def update
        user = User.find(params[:id])
        # byebug
        user.update(user_params)
        render json: user
    end

    def profile
        token = request.headers["Authentication"]
        payload = decode(token)
        user = User.find_by(id: payload["user_id"])
        matches = []
        user.likees.each{ |likee|
            user.likers.each { |liker|
                if liker === likee
                    matches << liker
                end
            }
        }
        rooms = []
        Room.where(user_two_id: user.id).each{ |room|
            # byebug
            roomObj = {id: room.id, recipient: room.user_one, messages: room.room_messages}
            rooms << roomObj
        }
        Room.where(user_one_id: user.id).each{ |room|
            roomObj = {id: room.id, recipient: room.user_two, messages: room.room_messages}
            rooms << roomObj
        }
        render json: { user_data: user, matches: matches, likees: user.likees, likers: user.likers, rooms: rooms }
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :bio, :year, :gender, :orientation, :birthdate, :likes_women, :likes_men, :likes_other, :asexual, :house, :favorite_spell, :image, :username)
    end
end
