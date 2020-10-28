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

  def display_with_index(meals)
    puts "🍣 🍦 List of available meals! 🍔 🍕"
    puts "--------------------"
    meals.each_with_index do |meal, index|
      puts "#{index + 1} -> #{meal.name}"
      puts "💵 $ #{meal.price}"
    end
  end
end
