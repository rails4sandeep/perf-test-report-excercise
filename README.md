# perf-test-report-excercise

### Installation

If you do not already have Ruby on your machine, go to http://rvm.io/ for installation

Once you have Ruby on your machine

`gem install bundler` (not required if you already have Ruby on your machine
 and you used it previously)
 
 Then go to the root of your directory and
 
 `bundle install`
 
 This should install all your dependencies 
 
 ### Running Tests
 
 `bundle exec rspec spec --format documentation --format html --out report.html`
 
 This should run all the specs and output an html test report
 
 ### Usage
 
 The library is organized into three classes in the generator directory. The generator,
 extractor and the organizer. The extractor extracts the performance test run
 data from the the directory provided to it. The organizer will process the
 data. The generator generates the report. The JSON file will be written to
  the `./public` directory.
 
 `@generator = Generator.new(path_to_csv_reports_dir)`
 
 `@generator.generate_json_report`
 
 The csv files are expected to be of the type that jmeter generates. There are 
 some sample csv reports attached in the `./specs/reports` directory for reference.
 They are expected to contain the following columns
 
 * Feature
 * Number of samples
 * Average
 * Median
 * 90 percentile
 * 95 percentile
 * 99 percentile
 * Minimum response time
 * Maximum response time
 * Error percentage
 * Throughput
 * Received data
 * Sent data
 
 The generated html report will also add a summary of the total samples, 
 average response time of the test, minimum response time of the test and 
 the maximum response time of the test 
 
 ### Others
 
 The generated JSON format report can be used as an input to make a visual html or 
 pdf report with graphs that can showcase the metrics in a easy to read way.
 
 If more time was provided for the exercise, I would have 
 * added a logger.
 * added a better organized JSON report
 * more formats of report
 *  
 
 
