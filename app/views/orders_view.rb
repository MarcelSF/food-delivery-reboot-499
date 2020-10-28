require_relative 'base_view'

class OrdersView < BaseView
  def display_with_index(employees)
    puts "Here are the available Delivery Guys"
    employees.each_with_index do |employee, index|
      puts "#{index + 1} #{employee.username}"
    end
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} - MEAL: #{order.meal.name}\n
      - EMPLOYEE: #{order.employee.username}\n
      - CUSTOMER: #{order.customer.name}\n
      -----------------------------------"
    end
  end
end
