class Customer
  attr_reader :name, :address
  attr_accessor :id
  def initialize(attrs={})
    @id = attrs[:id]
    @name = attrs[:name]
    @address = attrs[:address]
  end

  def self.headers
    %w(id name address)
  end

  def to_csv
    [@id, @name, @address]
  end
end
