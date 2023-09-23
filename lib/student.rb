require './person'

class Student < Person
  def initialize(age, parent_permission, name = 'Unknown')
    super(age, name)
    @parent_permission = parent_permission
  end

  def join_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(student)
  end

  def play_hooky?
    '¯(ツ)/¯'
  end

  attr_accessor :classroom
end
