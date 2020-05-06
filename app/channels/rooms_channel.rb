class RoomsChannel < ApplicationCable::Channel

    def subscribed
        # byebug
        @room = Room.find_by(id: params[:room])

        stream_from "rooms_#{@room.id}"
    end

    def recieved(data)
        @room = Room.find_by(id: params[:room])

        users = []
        users << @room.user_one
        users << @room.user_two
        byebug
        RoomsChannel.broadcast_to("rooms_#{@room.id}", {room: @room, users: users, messages: @room.room_messages})
    end

    def unsubscribed

    end

end