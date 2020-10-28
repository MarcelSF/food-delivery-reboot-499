require_relative 'base_view'

class SessionsView < BaseView
  def success(employee)
    puts "Welcome back #{employee.username} Your are logged in as a #{employee.role}"
  end

  def wrong_credentials
    puts "🔴 WRONG CREDENTIALS, TRY AGAIN! 🔴"
  end
end
