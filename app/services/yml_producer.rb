class YmlProducer
  attr_reader :yml, :data
  def initialize(data)
    @yml = build_json(data).to_yaml
    @data = data
  end

  private

  def build_json(data)
    json = {}
    data.each do |string|
      json.deep_merge(string_to_obj(key_arr(string.key), string.values.first.text))
    end
  end
  
  def string_to_obj(path, value)
    return value if path.length == 0
    obj = {}
    obj[path.first] = string_to_obj(path[1..-1], value)
    obj
  end

  def key_arr(key)
    key.split('/').reject(&:blank?)
  end
end