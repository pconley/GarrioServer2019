class ApiController < ApplicationController 
    skip_before_action :verify_authenticity_token

private

    def respond(status, message='', data=nil )
        if !data 
            json = nil
        elsif data.respond_to? :first
            # see the specific serializer for the content that is rendered out
            json = ActiveModel::Serializer::CollectionSerializer.new(data)
        else
            # there should be a better way to generically serialize an object
            # but here we convert to an array... serialize... then pull out first
            json = ActiveModel::Serializer::CollectionSerializer.new([data]).first
        end
        status_text = status == :ok ? 'SUCCESS' : 'ERROR'
        render json: {status: status_text, message: message, data: json}, status: status
    end

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