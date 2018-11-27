class ApiController < ApplicationController 
    skip_before_action :verify_authenticity_token


private

    ### UNIMPLEMENTED example of simple token auth

    def authenticate_user
      user_token = request.headers['X-USER-TOKEN']
      if user_token
        @user = User.find_by_token(user_token)
        #Unauthorize if a user object is not returned
        if @user.nil?
          return unauthorize
        end
      else
        return unauthorize
      end
    end

    def unauthorize
      head status: :unauthorized
      return false
    end

end