require 'spec_helper'

RSpec.describe "Organizer Spec" do
  before do
    @extractor = Extractor.new
    @csv_data_set = @extractor.build_data_set('./spec/reports')
    @organizer = Organizer.new(@csv_data_set)
  end

  it 'capture_features should return an Array of the features in the csv reports' do
    expect(@organizer.capture_features).to be_an_instance_of(Array)
  end

  it 'capture_samples should return an array of the number of samples mentioned in the csv reports' do
    expect(@organizer.capture_samples).to be_an_instance_of(Array)
  end

  it 'capture_averages should return an array of the averages mentioned in the csv reports' do
    expect(@organizer.capture_averages).to be_an_instance_of(Array)
  end

  it 'capture_medians should return an array of the medians mentioned in the csv reports' do
    expect(@organizer.capture_medians).to be_an_instance_of(Array)
  end

  it 'capture_90_percentile should return an array of the 90 percentiles for the samples mentioned in the csv report' do
    expect(@organizer.capture_90_percentiles).to be_an_instance_of(Array)
  end

  it 'capture_95_percentile should return an array of the 95 percentiles for the samples mentioned in the csv reports' do
    expect(@organizer.capture_95_percentiles).to be_an_instance_of(Array)
  end

  it 'capture_99_percentiles should return an array of the 99 percentiles for the samples mentioned in the csv reports' do
    expect(@organizer.capture_99_percentiles).to be_an_instance_of(Array)
  end

  it 'capture_mins should return an array of the mins mentioned in the reports for the feature samples' do
    expect(@organizer.capture_mins).to be_an_instance_of(Array)
  end

  it 'capture_maxs should return an array of the maximum response times recorded for the samples in the reports' do
    expect(@organizer.capture_maxs).to be_an_instance_of(Array)
  end

  it 'capture_error_percentages should return an Array of the error percentages in the test samples mentioned in csv report' do
    expect(@organizer.capture_error_percentages).to be_an_instance_of(Array)
  end

  it 'capture_throughputs should return an Array of the throughputs recorded for the feature samples in the csv reports' do
    expect(@organizer.capture_throughputs).to be_an_instance_of(Array)
  end

  it 'capture_received_data should return an Array of the received data in KB recorded in the csv reports' do
    expect(@organizer.capture_received_data).to be_an_instance_of(Array)
  end

  it 'capture_sent_data should return an Array of the sent data in KB recorded in the csv reports' do
    expect(@organizer.capture_sent_data).to be_an_instance_of(Array)
  end

  it 'extract_data_with_index should return an Array of the data contained in CSVs in the column passed in the metric index argument' do
    expect(@organizer.extract_data_with_index(2)).to be_an_instance_of(Array)
  end

  it 'generate_data_hash_for should return a Hash of the metrics passed in the argument for the features' do
    features = @organizer.capture_features
    samples = @organizer.capture_samples
    expect(@organizer.generate_data_hash_for(features, samples)).to be_an_instance_of(Hash)
  end

  it 'create_reports_hash should create a hash of all the metrics mentioned in the csv reports into one hash' do
    expect(@organizer.create_reports_hash).to be_an_instance_of(Hash)
  end

  it 'calculate_total_samples should return an Integer which is the count of the total number of the samples across the csv reports' do
    expect(@organizer.calculate_total_samples).to be_an_instance_of(Integer)
  end

  it 'calculate_average should return a Float which is the average of all the averages of the samples captured in the csv reports' do
    expect(@organizer.calculate_average).to be_an_instance_of(Float)
  end

  it 'find_min should return an Integer which is the the minimum response time of all the responses captured in the csv reports' do
    expect(@organizer.find_min).to be_an_instance_of(Integer)
  end

  it 'find_max should return an Integer which is the maximum response time of all the responses captured in the csv reports' do
    expect(@organizer.find_max).to be_an_instance_of(Integer)
  end

  it 'create_summary_hash should return a Hash of the calculated total samples, average, minimum and maximum response times' do
    expect(@organizer.create_summary_hash).to be_an_instance_of(Hash)
  end

end