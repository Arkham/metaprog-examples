my_var = "Success"

MyClass = Class.new do
  puts "#{my_var} in the class definition"

  define_method :my_method do
    puts "#{my_var} in the method"
  end
end

MyClass.new.my_method

class YourClass
  my_var = "Failure" # remove this and the next fails
  puts "#{my_var} in the class definition"

  def your_method
    my_var = "Distress" # remove this and the next fails
    puts "#{my_var} in the method"
  end
end

YourClass.new.your_method
