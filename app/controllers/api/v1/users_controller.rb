class Api::V1::UsersController < ApiController 

    respond_to :json

    def index
        users = User.all
        respond(:ok,"Users loaded",users)
    end 

    def show
        user = User.find(params[:id])
        respond(:ok,"User loaded",user)
    rescue ActiveRecord::RecordNotFound => e
        respond(:not_found,"User #{params[:id]} not found")
    end

end