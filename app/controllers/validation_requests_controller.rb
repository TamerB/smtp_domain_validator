class ValidationRequestsController < ApplicationController
  protect_from_forgery with: :null_session

  # GET /validation_requests
  def index
  end

  # POST /validation_requests
  def create
    @request = ValidationRequest.create

    current_second_requests_number = ValidationRequest.where("created_at >= ?", DateTime.now - 1.second).count
    response = {:message => {message: "Validation Request denied: At most 5 api requests per second are allowed!"}, :code => :method_not_allowed}

    if current_second_requests_number < 5
      response = email_exists() ? validate_email() : {:message => {message: "Bad Request... No email to validate!"}, :code => :bad_request}
    end

    flash.now[:message] = response[:message][:message]

    render "index", status: response[:code]
  end

  private

  def email_exists
    begin
      return (params[:email] != nil && !params[:email].blank? || params[:validation_request][:email] != nil && !params[:validation_request][:email].blank?)
    rescue
      return false
    end
  end
end
