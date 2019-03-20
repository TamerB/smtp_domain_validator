module EmailValidator
  require 'net/http'
  require 'json'

  def validate_email
    uri = URI("http://apilayer.net/api/check?" + "access_key=" + ENV['API_ACCESS_KEY'] + "&email=" + params[:validation_request][:email] + "&smtp=1&fomat=1")
    req = Net::HTTP::Get.new(uri)

    response = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    data = JSON.parse(response.body)
    logger.info(data)

    if data.key?('smtp_check')
      flash.now[:message] = (data['smtp_check'] ? "Valid" : "Invalid") + " SMTP domain!"
    else
      flash.now[:message] = "Something went wrong... Please try again later"
    end
  end
end
