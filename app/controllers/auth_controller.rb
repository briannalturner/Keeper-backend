class AuthController < ApplicationController

    def create
        username = params["username"]
        password = params["password"]
        user = User.find_by(username: username)
        if user && user.authenticate(password) 
            payload = {user_id: user.id}
            token = encode(payload)
            matches = []
            user.likees.each{ |likee|
                matches = user.likers.select { |liker|
                    liker === likee
                }
            }
            render json: { user: [user_data: user, matches: matches, likees: user.likees], token: token }
        else
            render json: {errors: "invalid credentials"}
        end
    end
end
