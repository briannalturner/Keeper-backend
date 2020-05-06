class RoomsController < ApplicationController

    def index
        rooms = Room.all
        render json: rooms
    end

    def show
        room = Room.find(params[:id])
        # byebug
        users = []
        users << room.user_one
        users << room.user_two
        messages = room.room_messages
        render json: {room: room, users: users, messages: messages}
    end
    
end