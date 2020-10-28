# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
  end

  def run
      # Ask the user to login and VERIFY the user.
    @employee = @sessions_controller.sign_in
      # If the user is a manager -> Route Manager actions
    case @employee.role
    when 'manager'
      while @running
      # print the manager menu
        print_manager_menu
      # get the manager choice
        choice = gets.chomp.to_i
        print `clear`
      # route the manager choice
        route_manager_action(choice)
      end
    when 'delivery_guy'
      while @running
       # print the delivery_guy menu
        print_delivery_menu
      # get the delivery_guy choice
        choice = gets.chomp.to_i
        print `clear`
      # route the delivery_guy choice
        route_delivery_action(choice)
      end
    end
  end

  def route_manager_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then stop!
    else
      puts "Wrong choice, try again"
    end
  end

  def route_delivery_action(choice)
    case choice
    when 1 then puts "TODO"
    else
      puts "Try again..."
    end
  end

  def print_manager_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Quit program"
    puts "> "
  end

  def print_delivery_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "TODO"
  end

  def stop!
    @running = false
  end
end