require './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    return unless classroom.respond_to?(:students)

    @classroom = classroom
    @classroom.add_student(self)
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
