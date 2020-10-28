require_relative 'base_view'

class CustomersView < BaseView
  def list_customers(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name}"
      puts "🚋 Address: #{customer.address}"
    end
  end
end
