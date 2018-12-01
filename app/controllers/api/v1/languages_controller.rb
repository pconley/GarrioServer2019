class Api::V1::LanguagesController < ApiController 

    respond_to :json

    def index
        languages = Language.all
        respond(:ok,"Languages loaded",languages)
    end 

    def show
        language = Language.find(params[:id])
        respond(:ok,"Language loaded by id",language)
    rescue ActiveRecord::RecordNotFound => e
        language = Language.find_by_code(params[:id])
        if language
            respond(:ok,"Language loaded by code",language)
        else
            respond(:not_found,"Language #{params[:id]} not found")
        end
    end

end