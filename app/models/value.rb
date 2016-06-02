class Value < ApplicationRecord
  belongs_to :language
  belongs_to :translation_string

  validates :language, presence: true
  validates :translation_string, presence: true
end
