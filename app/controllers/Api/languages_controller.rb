module Api
  class LanguagesController < ApplicationController
    before_action :authenticate

    def index
      render json: Language.all
    end
  end
end