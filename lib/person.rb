require './nameable'
require './rental'

class Person < Nameable
  def initialize(age, name = 'unknown',
                 parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id, :rentals
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent_book(date, book)
    Rental.new(date, self, book)
  end

  private

  def of_age?
    @age && @age >= 18
  end
end
