Dir['*.rb'].each { |file| require file }

class Generator
  def initialize(dir_path)
    @dir_path = dir_path
  end

  def generate_json_report
    @extractor = Extractor.new
    report_data_set = @extractor.build_data_set(@dir_path)

    @organizer = Organizer.new(report_data_set)
    reports_hash = @organizer.create_reports_hash
    @organizer.generate_reports_json(reports_hash)
    puts "JSON report written to ./public directory successfully"
  end
end