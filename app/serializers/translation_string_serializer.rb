class TranslationStringSerializer < ActiveModel::Serializer
  attributes :id, :key, :translations

  def translations
    res = {}
    object.values.each do |value|
      res[value.language.iso] = value.text
    end
    res
  end
end
