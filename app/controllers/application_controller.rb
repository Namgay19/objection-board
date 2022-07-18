class ApplicationController < ActionController::API
  include ErrorHandler

  before_action :authenticate_user!
end
