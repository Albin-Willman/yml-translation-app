require 'yaml'
class YMLReader
  attr_reader :data
	def initialize(yml)
    refine_data(YAML.load(yml))
  end

  private

  def refine_data(raw_data)
    @data = build_obj_array('', raw_data)
  end

  def build_obj_array(base_key, raw_data)
    return [{ key: base_key, string: raw_data }] if raw_data.is_a? String
    ret = []
    raw_data.each do |key, value|
      ret += build_obj_array("#{base_key}/#{key.to_s}", value)
    end
    ret
  end
end