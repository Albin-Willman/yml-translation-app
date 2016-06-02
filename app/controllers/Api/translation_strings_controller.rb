module Api
  class TranslationStringsController < ApplicationController
    def index
      render json: { data: [
        {
          key: 'path/something',
          translations: {
                  en: 'translate me',
                  sv: ''
            },
           },
           {
              key: 'path/something/else',
              translations:{
                  en: 'translate me as well',
                  sv: 'översatt'
              },
          },
        ] 
      }
    end

    def update
      render json: { data: true }
    end

    def uploadYML
      render json: { data: true }
    end
  end
end
