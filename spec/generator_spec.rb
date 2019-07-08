require 'spec_helper'

RSpec.describe "Generator Spec" do

  it 'generate_json_report should generate a summary report' do
    @generator = Generator.new('./spec/reports')
    @generator.generate_json_report
    expect(File.extname('../public/temp.json')).to eql('.json')
  end
end