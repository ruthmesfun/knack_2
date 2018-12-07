class ApplicationController < ActionController::Base
    include SessionsHelper
    require 'omniauth'

    CATEGORIES = Category.all

    def index
      render layout: "welcome"
    end
end
