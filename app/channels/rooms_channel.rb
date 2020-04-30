class RoomsChannel < ApplicationCable::Channel

    def subscribed
        # byebug
        @room = Room.find_by(id: params[:room])

        stream_for @room
    end

    def recieved(data)
        RoomsChannel.broadcast_to(@room, {room: @room, users: @room.users, messages: @room.messages})
    end

    def unsubscribed

    end

end