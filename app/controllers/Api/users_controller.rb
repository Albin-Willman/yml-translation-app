module Api
  class UsersController < ApplicationController
    
    def login
      render json: {
        data: {
          attributes: {
            user_id: 1,
            token: 'secret'
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
