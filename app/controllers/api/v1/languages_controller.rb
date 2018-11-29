class Api::V1::LanguagesController < ApiController 

    respond_to :json

    def index
        languages = Language.all
        respond(:ok,"Languages loaded",languages)
    end 

    def show
        language = Language.find(params[:id])
        respond(:ok,"Language loaded",language)
    rescue ActiveRecord::RecordNotFound => e
        respond(:not_found,"Language not found")
        # render json: { status: 'ERROR', e.to_s }, status: :not_found
    end

private

    def respond(status, message='', data=nil )
        status_text = status == :ok ? 'SUCCESS' : 'ERROR'
        # see serializer for the content that is rendered out
        render json: {status: status_text, message: message, data: data}, status: status
    end

end