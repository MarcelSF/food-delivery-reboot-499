class Meal
  attr_reader :name, :price
  attr_accessor :id
  def initialize(attrs={})
    @id = attrs[:id]
    @name = attrs[:name]
    @price = attrs[:price]
  end

  def self.headers
    %w(id name price)
  end

  def to_csv
    [@id, @name, @price]
  end
end
