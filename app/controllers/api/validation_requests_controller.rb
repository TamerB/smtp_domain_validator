class Api::ValidationRequestsController < ApplicationController
  protect_from_forgery with: :null_session
  include Response

  # POST /validation_requests
  def create
    @request = ValidationRequest.create

    current_second_requests_number = ValidationRequest.where("created_at >= ?", DateTime.now - 1.second).count
    response = {:message => {message: "Validation Request denied: At most 5 api requests per second are allowed!"}, :code => :method_not_allowed}

    if current_second_requests_number < 5
      response = email_exists() ? validate_email() : {:message => {message: "Bad Request... No email to validate!"}, :code => :bad_request}
    end

    json_response(response[:message], response[:code])
  end

  private

  def email_exists
    begin
      return (params[:email] != nil && !params[:email].blank?)
    rescue
      return false
    end
  end
end
