require 'spec_helper'
require 'json'

RSpec.describe "Generator Spec" do

  it 'generate_json_report should generate a summary report' do
    @generator = Generator.new('./spec/reports')
    @generator.generate_json_report
    expect(File.extname('../public/temp.json')).to eql('.json')
  end

  it 'generate_json_report created json should have the samples from the csv reports' do
    @generator = Generator.new('./spec/reports')
    @generator.generate_json_report
    text = File.read('./public/temp.json')
    @summary = JSON.parse(text)
    expect(@summary['samples'].nil?).to be false
  end

  it 'generate_json_report created json should have the features and metrics saved as key value pairs' do
    @generator = Generator.new('./spec/reports')
    @generator.generate_json_report
    text = File.read('./public/temp.json')
    @summary = JSON.parse(text)

    expect(@summary['samples']['login0']).to eq('50')
    expect(@summary['averages']['login0']).to eq('2159')
    expect(@summary['medians']['login0']).to eq('2159')
    expect(@summary['90_percentiles']['login0']).to eq('2819')
    expect(@summary['95_percentiles']['login0']).to eq('2920')
    expect(@summary['99_percentiles']['login0']).to eq('3356')
    expect(@summary['mins']['login0']).to eq('1298')
    expect(@summary['maxs']['login0']).to eq('3356')
    expect(@summary['throughputs']['login0']).to eq('2.01426')
    expect(@summary['received_data']['login0']).to eq('4.68')
    expect(@summary['sent_data']['login0']).to eq('1.27')
    expect(@summary['summary']['total_samples']).to eq(400)
  end
end