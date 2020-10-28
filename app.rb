# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/repositories/employee_repository"
require_relative "app/controllers/sessions_controller"
require_relative "app/repositories/order_repository"
require_relative "app/controllers/orders_controller"

require_relative "router"

meal_csv_file = File.join(__dir__, "data/meals.csv")
meal_repository = MealRepository.new(meal_csv_file)

customer_csv_file = File.join(__dir__, "data/customers.csv")
customer_repository = CustomerRepository.new(customer_csv_file)

# Customers Controller has a dependency on Customer Repository
customers_controller = CustomersController.new(customer_repository)
meals_controller = MealsController.new(meal_repository)

employee_csv_file = File.join(__dir__, "data/employees.csv")
employee_repository = EmployeeRepository.new(employee_csv_file)
sessions_controller = SessionsController.new(employee_repository)

orders_csv_file = File.join(__dir__, "data/orders.csv")
order_repository = OrderRepository.new(orders_csv_file, meal_repository, customer_repository, employee_repository)
orders_controller = OrdersController.new(meal_repository, customer_repository, employee_repository,order_repository)
# Router depends on TWO controllers(Meals and Customers)
router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)

router.run
