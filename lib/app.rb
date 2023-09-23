require './person'
require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @persons = []
    @books = []
  end

  attr_reader :persons, :books

  def add_student(age, name, permission)
    student = Student.new(age, nil, name, permission)
    @persons << student
  end

  def add_teacher(name, age, specialization)
    teacher = Teacher.new(age, specialization, name)
    @persons << teacher
  end

  def add_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def add_rental(date, book_index, person_index)
    Rental.new(date, @persons[person_index], @books[book_index])
  end

  def get_rental_by_person_id(person_id)
    person = @persons.find { |member| member.id == person_id }
    person.rentals
  end
end
