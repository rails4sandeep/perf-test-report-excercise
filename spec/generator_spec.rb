require 'spec_helper'

RSpec.describe "Performance test report generator" do

  it 'should generate a summary report' do
=begin
    @extractor = Extractor.new
    report_data_set = @extractor.build_data_set('./spec/reports')

    @organizer = Organizer.new(report_data_set)
    reports_hash = @organizer.create_reports_hash
    @organizer.generate_reports_json(reports_hash)
  end
=end
  @generator = Generator.new('./spec/reports')
  @generator.generate_json_report
  end
end