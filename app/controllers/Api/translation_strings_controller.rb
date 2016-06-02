require 'yaml'
module Api
  class TranslationStringsController < ApplicationController
    def index
      render json: TranslationString.all
    end

    def update
      render json: { status: :unprocessable_entity } unless params[:translations]
      params[:translations].each do |key, data|
        translation_string = TranslationString.find_by(key: key)
        data.each do |iso, string|
          set_translation(translation_string, language_obj[iso], string)
        end
      end
      render json: { data: params }
    end

    def uploadYML
      render json: { status: :unprocessable_entity } unless valid_yml(params[:yml])
      language = Language.find_by(iso: params[:language])
      strings = create_translation_strings(YMLReader.new(params[:yml]).data, language)
      remove_unwanted_strings(strings)
      render json: { data: true }
    end

    private

    def set_translation(translation_string, language, string)
      value = translation_string.values.find_or_initialize_by(language: language)
      value.text = string
      value.save!
    end

    def remove_unwanted_strings(wanted_strings)
      ids = wanted_strings.map(&:id)
      TranslationString.where.not(id: ids).destroy_all
    end

    def create_translation_strings(string_data, language)
      ret = []
      string_data.each do |obj|
        translation_string = TranslationString.find_or_create_by(key: obj[:key])
        set_translation(translation_string, language, obj[:string])
        ret << translation_string
      end
      ret
    end

    def language_obj
      return @language_obj if @language_obj
      @language_obj = {}
      Language.all.each do |l|
        @language_obj[l.iso] = l
      end
      @language_obj
    end

    def valid_yml(yml)
      !!YAML.load(yml)
    rescue Exception => e
      return false
    end
  end
end
