class Api:v1:LanguagesController < ApiController 
    def index
        languages = Language.all
        render json: {status: 'SUCCESS', message: 'Loaded all languages', data: languages}, status: :ok
    end 
end