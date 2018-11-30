RSpec.configure do |c|
    # just for fun we are re-naming the shared function name
    c.alias_it_should_behave_like_to :it_responds_like, 'responds like'
end

RSpec.shared_examples "a standard response" do  |http_response_code|
    # the separate 'it' statements will make the detailed document output more
    # interesting, but it causes each 'it' to be a seperate execution making more 
    # "tests" and thereby a slower rspec run :-(
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

RSpec.shared_examples "a standard index" do  |count|
    it 'has a standard show body' do 
        body = JSON.parse(response.body)
        status, message, data = parse(body)
        expect(status).to eq(OK_STATUS)
        expect(message).to match(/loaded/)
        expect(data.size).to eq(count)
    end
end

RSpec.shared_examples "a standard show" do 
    it 'has a standard show body' do 
        body = JSON.parse(response.body)
        status, message, data = parse(body)
        expect(status).to eq(OK_STATUS)
        expect(message).to match(/loaded/)
        expect(data['id']).to eq(resource_id)
    end
end

RSpec.shared_examples "a standard show error" do 
    it 'has a standard show error' do
        body = JSON.parse(response.body)
        status, message, data = parse(body)
        expect(status).to eq(ERR_STATUS)
        expect(message).to match(/not found/)
        expect(data).to be_nil
    end
end