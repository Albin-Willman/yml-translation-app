class Value < ApplicationRecord
  belongs_to :language
  belongs_to :translation_string
end
