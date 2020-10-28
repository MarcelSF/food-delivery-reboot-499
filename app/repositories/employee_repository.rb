require_relative 'base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository
  undef_method :create
  def build_element(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end

  def all_delivery_guys
    @elements.select { |element| element.delivery_guy? }
  end

  def find_delivery_guy(index)
    delivery_guys = all_delivery_guys
    delivery_guys[index]
  end

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end
end
