require './rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent(date, person)
    Rental.new(date, person, self)
  end

  attr_accessor :title, :author
  attr_reader :rentals
end
