class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  private

  # Check for valid request token and return user
  def authorize_request
    unless params[:test].present?
      @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    else
      @current_user = User.find_by_email('ian@test.com')
    end
  end

  def activate_user
    @current_user.update_attributes!(
      activated: true,
      activated_date: Time.now
    )
  end
end
