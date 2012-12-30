class MyArray < Array
  def my_method
    'Hello!'
  end
end

array = MyArray.new([1,2,3])
p array
puts array.my_method

YourArray = Class.new(Array) do
  def your_method
    'Hello!'
  end
end

array = YourArray.new([1,2,3])
p array
puts array.your_method
