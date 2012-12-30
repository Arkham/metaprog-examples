module Bark
  def bark
    "#{self}: #{'wof' * 6}"
  end
end

class DogSpeak < String
  include Bark
end

lassie_speak = DogSpeak.new("lassie")
puts lassie_speak.bark
lassie_speak.class.ancestors.each do |ancestor|
  puts "#{ancestor}, #{ancestor.class}"
end
puts

def lassie_speak.yawn
  "#{self} yaw#{'n' * 10}"
end

puts lassie_speak.yawn
lassie_speak.class.ancestors.each do |ancestor|
  puts "#{ancestor}, #{ancestor.class}"
end
