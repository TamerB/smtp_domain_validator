# spec/support/request_spec_helper
module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    begin
      JSON.parse(response.body)
    rescue
      JSON.parse({ message: response.body }.to_json)
    end
  end
end
