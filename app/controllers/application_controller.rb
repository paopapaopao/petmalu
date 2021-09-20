class ApplicationController < ActionController::Base
    layout "home", except: [:index]
end
