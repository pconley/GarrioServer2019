V1_BASE_URL = '/api/v1'

OK_STATUS = "SUCCESS"
ERR_STATUS = "ERROR"
  
module ApiMacros

    # def json
    #     JSON.parse(response.body)
    # end

    # def parse(jdata)
    #     return jdata['status'],jdata['message'],jdata['data']
    # end
      
    # def login_admin
    #     before(:each) do
    #     @request.env["devise.mapping"] = Devise.mappings[:admin]
    #     sign_in FactoryBot.create(:admin)
    #     end
    # end

    # def login_user
    #     before(:each) do
    #     @request.env["devise.mapping"] = Devise.mappings[:user]
    #     user = FactoryBot.create(:user)
    #     user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    #     sign_in user
    #     end
    # end
end
  