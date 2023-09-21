class Rental
  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    book.rentals << self
    person.rentals << self
  end

  attr_accessor :date
  attr_reader :person, :book
end
