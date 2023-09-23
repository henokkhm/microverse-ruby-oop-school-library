require './app'

app = App.new

def list_books(app)
  puts 'You have not added any books yet.' if app.books.empty?

  app.books.each do |book|
    puts "Title: \"#{book.title}\", Author: #{book.author}"
  end
end

def list_people(app)
  puts 'You have not added any students or teachers yet.' if app.persons.empty?

  app.persons.each do |person|
    type = 'Person'
    if person.instance_of?(Student)
      type = 'Student'
    elsif person.instance_of?(Teacher)
      type = 'Teacher'
    end
    puts "[#{type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

def create_person(app)
  print 'Do you want to create student (1) or a teacher (2)? [Input the number]: '
  valid_inputs = %w[1 2]
  user_input = gets.chomp

  until valid_inputs.member? user_input
    puts 'Please enter either 1 or 2:'
    user_input = gets.chomp
  end

  if user_input == '1'
    create_student(app)
  elsif user_input == '2'
    create_teacher(app)
  end

  puts 'Person created successfully'
end

def create_student(app)
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]: '
  parent_permission = gets.chomp.upcase
  app.add_student(name, age, parent_permission == 'Y')
end

def create_teacher(app)
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  print 'Specialization: '
  specialization = gets.chomp
  app.add_teacher(name, age, specialization)
end

def create_book(app)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.add_book(title, author)
  puts 'Book created successfully'
end

def accept_book_index(app)
  puts 'Select a book from the following list by number'
  app.books.each_with_index do |book, index|
    puts "#{index}) Title: #{book.title}, Author: #{book.author}"
  end

  book_index = gets.chomp.to_i

  until book_index >= 0 && book_index < app.books.length
    puts 'Please enter a valid index:'
    book_index = gets.chomp.to_i
  end

  book_index
end

def accept_person_index(app)
  puts 'Select person from the following list by number'
  app.persons.each_with_index do |person, index|
    person_type = person.instance_of?(Student) ? 'Student' : 'Teacher'
    puts "#{index})[#{person_type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  person_index = gets.chomp.to_i

  until person_index >= 0 && person_index < app.persons.length
    puts 'Please enter a valid index:'
    gets.chomp.to_i
  end

  person_index
end

def create_rental(app)
  book_index = accept_book_index(app)
  person_index = accept_person_index(app)

  print 'Date: '
  date = gets.chomp
  app.add_rental(date, book_index, person_index)
  puts 'Rental created successfully'
end

def list_rentals_for_person(app)
  puts 'ID of person:'
  person_id = gets.chomp.to_i
  rentals = app.get_rental_by_person_id(person_id)

  puts 'Rentals:'
  rentals.each do |rental|
    puts "Date: \"#{rental.date}\", Book: #{rental.book.title} by #{rental.book.author}"
  end
end

def exit_message(_app)
  puts 'Thank you for using this app!'
end

ACTIONS = {
  '1' => {
    prompt: 'List all books',
    handler: method(:list_books)
  },
  '2' => {
    prompt: 'List all people',
    handler: method(:list_people)
  },
  '3' => {
    prompt: 'Create a person',
    handler: method(:create_person)
  },
  '4' => {
    prompt: 'Create a book',
    handler: method(:create_book)
  },
  '5' => {
    prompt: 'Create a rental',
    handler: method(:create_rental)
  },
  '6' => {
    prompt: 'List all rentals for a given person id',
    handler: method(:list_rentals_for_person)
  },
  '7' => {
    prompt: 'Exit',
    handler: method(:exit_message)
  }
}.freeze

def main(app)
  puts 'Welcome to the School Library App!'
  loop do
    puts ''
    ACTIONS.each_pair do |action_id, action|
      puts "#{action_id} - #{action[:prompt]}"
    end

    selected_action_id = gets.chomp

    unless ACTIONS.key?(selected_action_id)
      puts 'Please enter a valid input'
      next
    end

    ACTIONS[selected_action_id][:handler].call(app)
    break if selected_action_id == '7'
  end
end

# start the application
main(app)
