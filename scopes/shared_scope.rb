lambda {
  spam = []

  Kernel.send :define_method, :add_stuff do |stuff|
    spam << stuff
  end

  Kernel.send :define_method, :spam_count do
    spam.count
  end
}.call

puts spam_count
add_stuff "sausage"
add_stuff "baked_beans"
puts spam_count
