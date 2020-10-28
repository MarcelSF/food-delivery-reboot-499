require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repo = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # ask the user for username
    username = @view.ask_for('username')
    # ask the user for password
    password = @view.ask_for('password')
    # access the employee repository and find the user with the username
    employee = @employee_repo.find_by_username(username)
    # compare the employee password with the input password
    if employee && employee.password == password
    # if correct -> return the employee
      @view.success(employee)
      return employee
    else
    # if wrong -> wrong password -> sign_in again
      @view.wrong_credentials
      sign_in
    end
  end
end
