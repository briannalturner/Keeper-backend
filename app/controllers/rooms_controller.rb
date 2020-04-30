class RoomsController < ApplicationController

    def index
        rooms = Room.all
        render json: rooms
    end

    def show
        # byebug
        room = Room.find(params[:id])
        # byebug
        render json: room, include: [:room_messages]
    end
    
end
