require 'spec_helper'

RSpec.describe "Extractor Spec" do

  before do
    @extractor = Extractor.new
  end

  it 'get_files should return an array of files in the directory' do
    @files_list = @extractor.get_files('./spec/reports')
    puts @files_list
    expect(@files_list).to be_an_instance_of(Array)
  end

  it 'get_files returned array should contain all the csv files present in the directory passed to it' do
    @files_list = @extractor.get_files('./spec/reports')
    expect(@files_list[0]).to eq('./spec/reports/sample_report.csv')
    expect(@files_list[1]).to eq('./spec/reports/sample_report2.csv')

    expect(File.extname('./spec/reports/sample_report.csv')).to eql('.csv')
    expect(File.extname('./spec/reports/sample_report2.csv')).to eql('.csv')
  end

  it 'build_data_set should return an Array' do
    @csv_data_set = @extractor.build_data_set('./spec/reports')
    expect(@csv_data_set).to be_an_instance_of(Array)
  end

  it 'each of the entries in the Array returned by build_data_set should be a CSV::Table' do
    @csv_data_set = @extractor.build_data_set('./spec/reports')
    @csv_data_set.each do |data_set|
      expect(data_set).to be_an_instance_of(CSV::Table)
      puts data_set
    end
  end

end