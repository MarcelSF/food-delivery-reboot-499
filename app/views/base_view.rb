class BaseView
  def ask_for(keyword)
    puts "Please type #{keyword}"
    gets.chomp
  end
end
