class ValidationRequestsController < ApplicationController
  #before_action :set_request, only: :show

  # GET /validation_requests
  def index
  end

  # POST /validation_requests
  def create
    @request = ValidationRequest.create

    current_second_requests_number = ValidationRequest.where("created_at >= ?", DateTime.now - 1.second).count
    flash.now[:message] = "Validation Request denied: At most 5 api requests per second are allowed!"

    if current_second_requests_number < 5
      flash.now[:message] = email_exists() ? validate_email() : "Bad Request... No email to validate!"
    end

    render "index"
  end

  # GET /validation_requests/:id
  #def show
  #  json_response(@request)
  #end

  private

  def email_exists
    return (params[:validation_request][:email] != nil and !params[:validation_request][:email].blank?)
  end

  #def set_request
  #  @request = ValidationRequest.find(params[:id])
  #end
end
