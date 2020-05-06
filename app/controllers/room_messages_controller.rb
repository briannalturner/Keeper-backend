class RoomMessagesController < ApplicationController

    def index
        messages = RoomMessage.all
        render json: messages, include: [:user => {:only => [:id]}]
    end

    def create
        room_message = RoomMessage.new(message_params)
        room = Room.find(params[:room_id])
        users = []
        users << room.user_one
        users << room.user_two
        # byebug
        if room_message.save
            # room_message.save
            # byebug
            RoomsChannel.broadcast_to(room, {
                room: room,
                users: users,
                messages: room.room_messages
            })
            render json: room_message
        else
            render json: {message: "save failed", errors: room_message.errors}
        end
    end

    private
    def message_params
        params.require(:room_message).permit(:room_id, :message, :user_id)
    end
end
