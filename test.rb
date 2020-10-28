require_relative 'app/models/order'
require_relative 'app/models/customer'
require_relative 'app/models/meal'
require_relative 'app/models/employee'

meal = Meal.new(name: 'Pizza', price: 10, id: 1)
customer = Customer.new(name: 'Cynthia', address: 'Macaé', id: 1)
employee = Employee.new(username: 'guilherme', password: '123456', role: 'delivery_guy', id: 1)


order = Order.new(meal: meal, customer: customer, employee: employee, id: 1)



p order.meal.price # Meal Object
p order.employee.username # Employee Object
p order.customer.address # Customer

#<Order:0x00007fcc3c8709c8 @id=1, @delivered=false, @meal=#<Meal:0x00007fcc3c870c20 @id=1, @name="Pizza", @price=10>, @customer=#<Customer:0x00007fcc3c870b30 @id=1, @name="Cynthia", @address="Macaé">, @employee=#<Employee:0x00007fcc3c870a40 @id=1, @username="guilherme", @password="123456", @role="delivery_guy">>
