class RoomMessagesController < ApplicationController

    def index
        messages = RoomMessage.all
        render json: messages
    end

    def create
        room_message = RoomMessage.new(message_params)
        room = Room.find(params[:room_id])
        if room_message
            room_message.save
            RoomsChannel.broadcast_to(room, {
                room: RoomSerializer.new(room),
                users: UserSerializer.new(room.users),
                messages: MessageSerializer.new(room.messages)
            })
            render json: MessageSerializer.new(room_message)
        else
            render json: {message: "save failed", errors: room_message.errors}
        end
    end

    private
    def message_params
        params.require(:room_message).permit(:room_id, :message, :user_id)
    end
end
