class RoomsController < ApplicationController

    def index
        rooms = Room.all
        render json: rooms, only: [:id, :user_one_id, :user_two_id]
    end

    def show
        room = Room.find(params[:id])
        # byebug
        users = []
        users << room.user_one
        users << room.user_two
        messages = room.room_messages.map{ |room_message| {id: room_message.id, message: room_message.message, user: room_message.user.id}}
        render json: {room: room, users: users, messages: messages}
    end

    def create 
        room = Room.new(room_params)
        if room.save
            ActionCable.server.broadcast 'rooms_channel', room
            head :ok
        end
    end

    private
    def room_params
        params.permit(:user_one_id, :user_two_id)
    end
    
end