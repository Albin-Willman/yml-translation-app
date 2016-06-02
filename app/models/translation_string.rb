class TranslationString < ActiveRecord::Base
	has_many :values, dependent: :destroy
end
