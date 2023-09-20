require './rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent(date, person)
    new_rental = Rental.new(date, person, self)
    @rental << new_rental
  end

  attr_accessor :title, :author
  attr_reader :rentals
end
