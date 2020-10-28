class Order
  attr_reader :delivered, :meal, :customer, :employee
  attr_accessor :id
  def initialize(attrs={})
    @id = attrs[:id]
    @delivered = attrs[:delivered] || false
    @meal = attrs[:meal]
    @customer = attrs[:customer]
    @employee = attrs[:employee]
  end

  def to_csv # its taking all the necessary information from the model and passing it to the csv
    [@id, @delivered, @meal.id, @customer.id, @employee.id]
  end

  def self.headers
    %w(id delivered meal_id customer_id employee_id)
  end

  def deliver!
    @delivered = true
  end

  def delivered?
    @delivered # this returns a boolean!
  end
end
