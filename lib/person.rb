require './nameable'

class Person < Nameable
  def initialize(age, name = 'unknown',
                 parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age && @age >= 18
  end

  def correct_name
    @name
  end
end
