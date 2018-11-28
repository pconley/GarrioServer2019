class Api::V1::LanguagesController < ApiController 

    def index
        languages = Language.all
        render json: {status: 'SUCCESS', message: 'Loaded all languages', data: languages}, status: :ok
    end 

    def show
        language = Language.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded language', data: language}, status: :ok
    rescue ActiveRecord::RecordNotFound => e
        render json: {
          error: e.to_s
        }, status: :not_found
    end

end