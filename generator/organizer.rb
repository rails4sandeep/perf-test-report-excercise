require 'json'

class Organizer

  def initialize(csv_data_set)
    @csv_data_set = csv_data_set
  end

  def capture_features
    sample = []
    @csv_data_set.each_with_index do |data_set, index|
      data_set.each do |ds|
        sample << (ds[0] + index.to_s)
      end
    end
    sample
  end

  def capture_samples
    extract_data_with_index(1)
  end

  def capture_averages
    extract_data_with_index(2)
  end

  def capture_medians
    extract_data_with_index(3)
  end

  def capture_90_percentiles
    extract_data_with_index(4)
  end

  def capture_95_percentiles
    extract_data_with_index(5)
  end

  def capture_99_percentiles
    extract_data_with_index(6)
  end

  def capture_mins
    extract_data_with_index(7)
  end

  def capture_maxs
    extract_data_with_index(8)
  end

  def capture_error_percentages
    extract_data_with_index(9)
  end

  def capture_throughputs
    extract_data_with_index(10)
  end

  def capture_received_data
    extract_data_with_index(11)
  end

  def capture_sent_data
    extract_data_with_index(12)
  end

  def extract_data_with_index(metric_index)
    sample = []
    @csv_data_set.each_with_index do |data_set, index|
      data_set.each do |ds|
        sample << ds[metric_index]
      end
    end
    sample
  end

  def generate_data_hash_for(features, metrics)
    sample_hash = {}
    features.each_with_index do |value, index|
      sample_hash[features[index]] = metrics[index]
    end
    sample_hash
  end

  def create_samples_hash
    generate_data_hash_for(capture_features, capture_samples)
  end

  def create_averages_hash
    generate_data_hash_for(capture_features, capture_averages)
  end

  def create_medians_hash
    generate_data_hash_for(capture_features, capture_medians)
  end

  def create_90percentiles_hash
    generate_data_hash_for(capture_features, capture_90_percentiles)
  end

  def create_95percentiles_hash
    generate_data_hash_for(capture_features, capture_95_percentiles)
  end

  def create_99percentiles_hash
    generate_data_hash_for(capture_features, capture_99_percentiles)
  end

  def create_error_percentages_hash
    generate_data_hash_for(capture_features, capture_error_percentages)
  end

  def create_mins_hash
    generate_data_hash_for(capture_features, capture_mins)
  end

  def create_maxs_hash
    generate_data_hash_for(capture_features, capture_maxs)
  end

  def create_throughputs_hash
    generate_data_hash_for(capture_features, capture_throughputs)
  end

  def create_received_data_hash
    generate_data_hash_for(capture_features, capture_received_data)
  end

  def create_sent_data_hash
    generate_data_hash_for(capture_features, capture_sent_data)
  end

  def create_reports_hash
    report = {}
    report['samples'] = create_samples_hash
    report['averages'] = create_averages_hash
    report['medians'] = create_averages_hash
    report['90_percentiles'] = create_90percentiles_hash
    report['95_percentiles'] = create_95percentiles_hash
    report['99_percentiles'] = create_99percentiles_hash
    report['mins'] = create_mins_hash
    report['maxs'] = create_maxs_hash
    report['error_percentages'] = create_error_percentages_hash
    report['throughputs'] = create_throughputs_hash
    report['received_data'] = create_received_data_hash
    report['sent_data'] = create_sent_data_hash
    report['summary'] = create_summary_hash
    report
  end

  def generate_reports_json(report_hash)
    File.open("public/temp.json","w") do |f|
      f.write(report_hash.to_json)
    end
  end

  def calculate_total_samples
    samples = 0
    samples_array = capture_samples
    samples_array.each do |sample|
      samples += sample.to_i
    end
    samples
  end

  def calculate_average
    sum = 0
    averages_array = capture_averages
    averages_array.each do |sample|
      sum += sample.to_i
    end
    sum/averages_array.count.to_f
  end

  def find_min
    capture_mins.map(&:to_i).min
  end

  def find_max
    capture_maxs.map(&:to_i).max
  end

  def create_summary_hash
    summary = {}
    summary['total_samples'] = calculate_total_samples
    summary['average_response_time'] = calculate_average
    summary['minimum_response_time'] = find_min
    summary['maximum_response_time'] = find_max
    summary
  end
end