class PingController < ApplicationController
  skip_before_action :authorize_request, only: :root

  def root
    render json: {
      app: 'newryd_api',
      message: 'Welcome to the Newryd API, see readme for more info'
    }
  end
end
