RSpec.configure do |c|
    # just for fun we are re-naming the shared function name
    c.alias_it_should_behave_like_to :it_responds_like, 'responds like'
    c.alias_it_should_behave_like_to :it_responds_with, 'responds with'
end

RSpec.shared_examples "a standard response" do  |http_response_code|
    # the separate 'it' statements will make the detailed document output more
    # interesting, but it causes each 'it' to be a seperate execution making more 
    # "tests" and thereby a slower rspec run... so i generally don't do this...
    it 'has the http status' do 
        expect(response).to have_http_status(http_response_code)
    end
    it 'has the json type' do 
        expect(response.content_type).to eq("application/json")
    end
    it 'has the json body' do 
        body = JSON.parse(response.body)
        expect(body).not_to be_empty
    end
end

RSpec.shared_examples "a standard index" do
    it 'has a standard show body' do 
        body = JSON.parse(response.body)
        expect(body['status']).to eq(OK_STATUS)
        expect(body['message']).to match(/loaded/)
        # resource_cnt must be set in the calling block
        expect(body['data'].size).to eq(resource_cnt)
    end
end

RSpec.shared_examples "a standard show" do 
    it 'has a standard show body' do 
        body = JSON.parse(response.body)
        expect(body['status']).to eq(OK_STATUS)
        expect(body['message']).to match(/loaded/)
        # resource_id must be set in the calling block
        expect(body['data']['id']).to eq(resource_id)
    end
end

RSpec.shared_examples "a standard show error" do 
    it 'has a standard show error' do
        body = JSON.parse(response.body)
        puts body
        expect(body['status']).to eq(ERR_STATUS)
        expect(body['message']).to match(/not found/)
        expect(body['data']).to be_nil
    end
end

RSpec.shared_examples "only expected fields" do |fields|
    it 'has only expected fields' do
        body = JSON.parse(response.body)
        expect(body).not_to be_empty, "missing body in response"
        keys = body['data'].keys
        missing_fields = fields.select {|f| !keys.include? f }
        extra_fields = keys.select {|k| !fields.include? k }
        error_message = "missing #{missing_fields} and/or extra #{extra_fields} fields found in response"
        expect(extra_fields.length + missing_fields.length).to eq(0), error_message
    end
end