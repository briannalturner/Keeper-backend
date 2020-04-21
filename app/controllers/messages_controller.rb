class MessagesController < ApplicationController

    def index
        messages = Message.all
        render json: messages
    end

    def show
        message = Message.find(params[:id])
        render json: message
    end

    def create
        message = Message.new(message_params)
        if message.valid?
            message.save
            render json: message
        else
            render json: {message: "save failed", errors: message.errors}
        end
    end

    private

    def message_params
        params.require(:message).permit(:sender, :recipient, :text)
    end

end
