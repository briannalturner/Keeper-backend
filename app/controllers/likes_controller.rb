class LikesController < ApplicationController

    def index
        likes = Like.all
        render json: likes, include: [:liker, :likee]
    end

    def show
        like = Like.find(params[:id])
        render json: like
    end

    def create
        like = Like.new(like_params)
        if like.valid?
            like.save
            render json: like
        else
            render json: {message: "save failed", errors: like.errors, like: like}
        end
    end

    def delete
        like = Like.find_by(likee_id: params["likee_id"], liker_id: params["liker_id"])
        like.delete
        render json: {message: "like deleted"}
    end

    private

    def like_params
        params.require(:like).permit(:liker_id, :likee_id)
    end
    
end
