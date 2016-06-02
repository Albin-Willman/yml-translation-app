require 'rails_helper'

RSpec.describe YMLReader do

  it 'builds objects from yml file' do
    data = described_class.new(yml_string).data

    first_obj = data.first
    expect(first_obj[:key]).to eq('/test/base/first')
    expect(first_obj[:string]).to eq('first')
  end

  it 'builds the correct number of objects' do
    data = described_class.new(yml_string).data
    expect(data.length).to eq(2)
  end

  def yml_string
    File.open('spec/services/files/test_data.yml').read
  end
end
