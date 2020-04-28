class AuthController < ApplicationController

    def create
        username = params["username"]
        password = params["password"]
        user = User.find_by(username: username)
        if user && user.authenticate(password) 
            payload = {user_id: user.id}
            token = encode(payload)
            render json: {user: user, token: token}
        else
            render json: {errors: "invalid credentials"}
        end
    end
end
