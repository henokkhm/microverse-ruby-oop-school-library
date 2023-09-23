require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
    @parent_permission = true
  end

  def can_use_services?
    true
  end
end
