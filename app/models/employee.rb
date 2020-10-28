class Employee
  attr_reader :username, :password, :role
  attr_accessor :id
  def initialize(attrs={})
    @id = attrs[:id]
    @username = attrs[:username]
    @password = attrs[:password]
    @role = attrs[:role]
  end

  def manager?
    @role == 'manager' # returns a boolean
  end

  def delivery_guy?
    @role == 'delivery_guy'
  end

  def self.headers
    %w(id username password role)
  end

  def to_csv
    [@id, @username, @password, @role]
  end
end
