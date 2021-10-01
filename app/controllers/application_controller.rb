class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path, alert: 'You do not have access to this page'
  end
end
