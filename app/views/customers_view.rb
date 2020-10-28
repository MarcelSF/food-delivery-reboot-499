require_relative 'base_view'

class CustomersView < BaseView
  def list_customers(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name}"
      puts "🚋 Address: #{customer.address}"
    end
  end

  def display_with_index(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name}"
      puts "🚋 Address: #{customer.address}"
    end
  end
end
