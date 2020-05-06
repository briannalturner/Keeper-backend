class RoomsChannel < ApplicationCable::Channel

    def subscribed
        # byebug
        @room = Room.find(params[:room])
        stream_for @room
    end
    
    def unsubscribed

    end

    def receive(data)
        # byebug
        @room = Room.find_by(id: data[:room])
        RoomsChannel.broadcast_to("rooms_#{@room.id}", {message: data["message"]})
    end


end