module Api
  class UsersController < ApplicationController

    NON_USER_ACTIONS = [:login, :logout]
    before_action :authenticate, except: NON_USER_ACTIONS

    def login
      unless params[:user][:email] == ENV['SECRET_USER'] && params[:user][:password] == ENV['SECRET_PASSWORD']
        render json: { }, status: :unauthorized and return
      }
      end
      render json: {
        data: {
          attributes: {
            user_id: 1,
            token: ENV["SECRET_AUTH_TOKEN"]
          }
        }
      }
    end
    
    def verify
      render json: { data: true }
    end
    
    def logout
      render json: { data: true }
    end
  end
end
