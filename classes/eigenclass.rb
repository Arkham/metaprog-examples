class Dog < String
  def bark
    puts "#{self}: woof!"
  end

  def self.type
    'dog'
  end
end

charlie = Dog.new("Charlie")
charlie.bark

charlie_eigenclass = class << charlie
  self
end

def charlie.growl
  "#{self}: awrrrr"
end

puts charlie_eigenclass
puts charlie_eigenclass.class
puts charlie_eigenclass.superclass

puts charlie.singleton_methods
