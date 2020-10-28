require 'csv'
class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_to_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements.find {|element| element.id == id}
  end

  def save_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << @elements.last.class.headers# HEADERS are exclusive to each model
      @elements.each do |element|
        csv << element.to_csv # Which values should we pass?
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file, csv_options) do |row|
      # Instantiate an object
      element = build_element(row)
      # add the object to the @elements array
      @elements << element
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end
end
