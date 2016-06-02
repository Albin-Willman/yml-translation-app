class TranslationString < ActiveRecord::Base
	default_scope { includes(values: :language) }
	has_many :values, dependent: :destroy
end
