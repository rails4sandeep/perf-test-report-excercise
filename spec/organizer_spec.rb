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

  it 'capture_features returned Array contents should match the features list in the CSV reports' do
    features = @organizer.capture_features
    expect(features).to eq(["login0", "dashboard0", "users0", "accessgroups0", "login1", "dashboard1", "users1", "accessgroups1"])
  end

  it 'capture_features returned Array length should match the number of features mentioned in the CSV reports' do
    features = @organizer.capture_features
    expect(features.length).to eq(8)
  end

  it 'capture_samples should return an array of the number of samples mentioned in the csv reports' do
    expect(@organizer.capture_samples).to be_an_instance_of(Array)
  end

  it 'capture_samples returned array should include all the samples mentioned in the csv reports' do
    samples = @organizer.capture_samples
    expect(samples).to eq(["50", "50", "50", "50", "50", "50", "50", "50"])
  end

  it 'capture_averages should return an array of the averages mentioned in the csv reports' do
    expect(@organizer.capture_averages).to be_an_instance_of(Array)
  end

  it 'capture_averages returned array should include all the averages mentioned in the csv reports' do
    averages = @organizer.capture_averages
    expect(@organizer.capture_averages).to eq(["2159", "64", "21", "22", "2159", "64", "21", "22"])
  end

  it 'capture_medians should return an array of the medians mentioned in the csv reports' do
    expect(@organizer.capture_medians).to be_an_instance_of(Array)
  end

  it 'capture_medians returned array should contain all the medians mentioned in the csv reports' do
    expect(@organizer.capture_medians).to eq(["2076", "71", "18", "18", "2076", "71", "18", "18"])
  end

  it 'capture_90_percentile should return an array of the 90 percentiles for the samples mentioned in the csv report' do
    expect(@organizer.capture_90_percentiles).to be_an_instance_of(Array)
  end

  it 'capture_90_percentile returned array should contain all the 90 percentiles mentioned in the csv reports' do
    expect(@organizer.capture_90_percentiles).to eq(["2819", "131", "21", "20", "2819", "131", "21", "20"])
  end

  it 'capture_95_percentile should return an array of the 95 percentiles for the samples mentioned in the csv reports' do
    expect(@organizer.capture_95_percentiles).to be_an_instance_of(Array)
  end

  it 'capture_95_percentile returned array should contain all the 95 percentiles mentioned in the csv reports' do
    expect(@organizer.capture_95_percentiles).to eq(["2920", "136", "26", "27", "2920", "136", "26", "27"])
  end

  it 'capture_99_percentiles should return an array of the 99 percentiles for the samples mentioned in the csv reports' do
    expect(@organizer.capture_99_percentiles).to be_an_instance_of(Array)
  end

  it 'capture_99_percentile should return an array of the 99 percentiles for the samples mentioned in the csv reports' do
    expect(@organizer.capture_99_percentiles).to eq(["3356", "176", "99", "99", "3356", "176", "99", "99"])
  end

  it 'capture_mins should return an array of the mins mentioned in the reports for the feature samples' do
    expect(@organizer.capture_mins).to be_an_instance_of(Array)
  end

  it 'capture_mins returned array should contain all the minimum response times captured in the reports for each of the features' do
    expect(@organizer.capture_mins).to eq(["1298", "14", "15", "13", "1298", "14", "15", "13"])
  end

  it 'capture_maxs should return an array of the maximum response times recorded for the samples in the reports' do
    expect(@organizer.capture_maxs).to be_an_instance_of(Array)
  end

  it 'capture_maxs returned array should contain all the maximum response times captured in the reports for the features' do
    expect(@organizer.capture_maxs).to eq(["3356", "176", "99", "99", "3356", "176", "99", "99"])
  end
  it 'capture_error_percentages should return an Array of the error percentages in the test samples mentioned in csv report' do
    expect(@organizer.capture_error_percentages).to be_an_instance_of(Array)
  end

  it 'capture_error_percentages returned array should the error percentages captured for the features in the csv reports' do
    expect(@organizer.capture_error_percentages).to eq(["0.000%", "0.000%", "0.000%", "0.000%", "0.000%", "0.000%", "0.000%", "0.000%"])
  end
  it 'capture_throughputs should return an Array of the throughputs recorded for the feature samples in the csv reports' do
    expect(@organizer.capture_throughputs).to be_an_instance_of(Array)
  end

  it 'capture_throughputs returned array should contain the throughputs captured for the feature samples in the csv reports' do
    expect(@organizer.capture_throughputs).to eq(["2.01426", "2.19771", "2.19800", "2.19780", "2.01426", "2.19771", "2.19800", "2.19780"])
  end
  it 'capture_received_data should return an Array of the received data in KB recorded in the csv reports' do
    expect(@organizer.capture_received_data).to be_an_instance_of(Array)
  end

  it 'capture_received_data returned array should contain the data received for each of the features in the csv reports' do
    expect(@organizer.capture_received_data).to eq(["4.68", "4.45", "4.45", "4.45", "4.68", "4.45", "4.45", "4.45"])
  end

  it 'capture_sent_data should return an Array of the sent data in KB recorded in the csv reports' do
    expect(@organizer.capture_sent_data).to be_an_instance_of(Array)
  end

  it 'capture_sent_data returned array should contain the sent data in KB recorded in the csv reports' do
    expect(@organizer.capture_sent_data).to eq(["1.27", "0.27", "0.26", "0.27", "1.27", "0.27", "0.26", "0.27"])
  end

  it 'extract_data_with_index should return an Array of the data contained in CSVs in the column passed in the metric index argument' do
    expect(@organizer.extract_data_with_index(2)).to be_an_instance_of(Array)
  end

  it 'generate_data_hash_for should return a Hash of the metrics passed in the argument for the features' do
    features = @organizer.capture_features
    samples = @organizer.capture_samples
    expect(@organizer.generate_data_hash_for(features, samples)).to be_an_instance_of(Hash)
  end

  it 'generate_data_hash_for returned hash should contain features and metric data as key value pairs' do
    features = @organizer.capture_features
    samples = @organizer.capture_samples
    data_hash = @organizer.generate_data_hash_for(features, samples)
    expect(data_hash['login0']).to eq('50')
  end

  it 'the duplicate keys in the Hash returned by generate_data_hash_for should have an index appended at the end to make them unique' do
    features = @organizer.capture_features
    samples = @organizer.capture_samples
    data_hash = @organizer.generate_data_hash_for(features, samples)
    data_hash.keys.each do |key|
      expect(key).to match(/[0-9]/)
    end
  end

  it 'create_reports_hash should create a hash of all the metrics mentioned in the csv reports into one hash' do
    expect(@organizer.create_reports_hash).to be_an_instance_of(Hash)
  end

  it 'calculate_total_samples should return an Integer which is the count of the total number of the samples across the csv reports' do
    expect(@organizer.calculate_total_samples).to be_an_instance_of(Integer)
  end

  it 'calculate_total_samples returned Integer should be the total of all the samples mentioned in the csv reports' do
    expect(@organizer.calculate_total_samples).to eq(400)
  end

  it 'calculate_average should return a Float which is the average of all the averages of the samples captured in the csv reports' do
    expect(@organizer.calculate_average).to be_an_instance_of(Float)
  end

  it 'calculate_average returned value should be the average of all the averages mentioned in the csv reports' do
    expect(@organizer.calculate_average).to eq(566.5)
  end

  it 'find_min should return an Integer which is the the minimum response time of all the responses captured in the csv reports' do
    expect(@organizer.find_min).to be_an_instance_of(Integer)
  end

  it 'find_min returned value should the minimum of all the minimum response times calculated and mentioned in the csv reports' do
    expect(@organizer.find_min).to eq(13)
  end

  it 'find_max should return an Integer which is the maximum response time of all the responses captured in the csv reports' do
    expect(@organizer.find_max).to be_an_instance_of(Integer)
  end

  it 'find_max returned value should be the maximum of all the maximum response times captured in the csv reports' do
    expect(@organizer.find_max).to eq(3356)
  end
  it 'create_summary_hash should return a Hash of the calculated total samples, average, minimum and maximum response times' do
    expect(@organizer.create_summary_hash).to be_an_instance_of(Hash)
  end

  it 'create_summary_hash returned hash should contain the calculated average, minimum and maximum response times' do
    summary = @organizer.create_summary_hash
    expect(summary['total_samples']).to eq(400)
    expect(summary['average_response_time']).to eq(566.5)
    expect(summary['minimum_response_time']).to eq(13)
    expect(summary['maximum_response_time']).to eq(3356)
  end

end