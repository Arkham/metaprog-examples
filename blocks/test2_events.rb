event "the lake is deep" do
  @lake_depth > 200
end

setup do
  puts "Setting up lake"
  @lake_depth = 300
end
