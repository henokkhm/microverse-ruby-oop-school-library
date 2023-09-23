def display_main_menu
  puts ''
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def execute_action(selected_action)
  case selected_action
    when '1'
      puts 'You have chosen option 1'
    when '2'
      puts 'You have chosen option 2'
    when '3'
      puts 'You have chosen option 3'
    when '4'
      puts 'You have chosen option 4'
    when '5'
      puts 'You have chosen option 5'
    when '6'
      puts 'You have chosen option 6'
    when '7'
      puts 'Than you for using this app!'
      return true
    else
      puts 'Please enter a valid choice'
    end
  return false
end

def main()
  puts 'Welcome to the School Library App!'
  loop do
    display_main_menu
    selected_action = gets.chomp
    exit = execute_action(selected_action)
    break if exit
  end
end

main
