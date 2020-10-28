require_relative 'base_repository'

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file = csv_file
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
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

  def undelivered_orders
    @elements.reject { |element| element.delivered? }
  end

  def my_undelivered_orders(id)
    undelivered = undelivered_orders
    undelivered.select{ |order| order.employee.id == id }
  end

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:delivered] = row[:delivered] == 'true'
    row[:meal] = @meal_repository.find(row[:meal_id].to_i) # returns a Meal object
    row[:customer] = @customer_repository.find(row[:customer_id].to_i) # returns a Customer object
    row[:employee] = @employee_repository.find(row[:employee_id].to_i) # returns a Employee object
    Order.new(row)
  end
end
