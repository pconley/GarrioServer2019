# spec/support/request_spec_helper
module RequestMacros
    # Parse JSON response to ruby hash
    def json
      JSON.parse(response.body)
    end
  end