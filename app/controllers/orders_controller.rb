require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../models/order'
require 'pry-byebug'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository,order_repository)
    @meal_repository = meal_repository
    @order_repository = order_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @view.display(orders)
  end

  def list_my_orders(employee)
    @undelivered = @order_repository.undelivered_orders.select { |order| order.employee == employee}
  #   my_orders = @order_repository.my_undelivered_orders(employee.id)
    @view.display(@undelivered)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    index = @view.ask_for('index').to_i
    order = @undelivered[index - 1]
    @order_repository.mark_as_delivered(order)
  end

  def add
    meal = choose_meal
    # see all customers
    customer = choose_customer
    employee = choose_employee
    # instantiate a new ORDER object
    order = Order.new(meal: meal, customer: customer, employee: employee)
    # pass that object to the OrderRepository
    @order_repository.create(order)
  end

  def choose_employee
    #see all delivery guys
    @view.display_with_index(@employee_repository.all_delivery_guys)
    # Choose a delivery guy
    delivery_index = @view.ask_for('delivery guy index').to_i
    employee = @employee_repository.find_delivery_guy(delivery_index - 1)
    return employee
  end

  def choose_meal
    @meals_view.display_with_index(@meal_repository.all)
    # choose a meal
    meal_index = @view.ask_for('meal index').to_i
    meal = @meal_repository.find_by_index(meal_index - 1)
    return meal
  end

  def choose_customer
    @customers_view.display_with_index(@customer_repository.all)
    # Choose a customer
    customer_index = @view.ask_for('customer index').to_i
    customer = @customer_repository.find_by_index(customer_index - 1)
    return customer
  end
end
