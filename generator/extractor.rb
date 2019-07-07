require 'csv'

class Extractor
  def initialize
    @files_list = []
    @csv_data_set = []
  end

  def get_files(dir_path)
    Dir[dir_path + '/*.csv'].each do |file|
      @files_list << file
    end
    @files_list
  end

  def parse_file(file)
    CSV.read(file, headers: true)
  end

  def build_data_set(dir_path)
    @files_list = get_files(dir_path)
    @files_list.each do |file|
      csv_data = parse_file(file)
      @csv_data_set << csv_data
    end
    @csv_data_set
  end

end
