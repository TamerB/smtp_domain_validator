class ApplicationController < ActionController::Base
  include ExceptionHandler
  include EmailValidator
end
