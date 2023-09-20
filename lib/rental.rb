class Rental
  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
  end

  attr_accessor :date
  attr_reader :person, :book
end
