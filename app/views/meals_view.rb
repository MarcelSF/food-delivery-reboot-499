require_relative 'base_view'

class MealsView < BaseView
  def display(meals)
    puts "🍣 🍦 List of available meals! 🍔 🍕"
    puts "--------------------"
    meals.each do |meal|
      puts "#{meal.id} -> #{meal.name}"
      puts "💵 $ #{meal.price}"
    end
  end
end
