class Person

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greeting
    "Hi, my name is #{name}"
  end

end

class Student < Person
  def learn
    "I get it!"
  end
end

class Instructor < Person
  def teach
    "Everything in Ruby is and Object."
  end
end

chris = Instructor.new("Chris")
christina = Student.new("Christina")

puts chris.greeting
puts christina.greeting

puts chris.teach

puts christina.learn

# puts christina.teach

# christina is not a member of class Instructor, so
# doesnt have access to the local method 'teach'
# if 'teach' was local to the 'Person' class, she would
