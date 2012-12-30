def event(name, &block)
  @events[name] = block
end

def setup(&block)
  @setups << block
end

Dir.glob('*events.rb').each do |file|
  @events = {}
  @setups = []

  load file

  @events.each do |name, event|
    subject = Object.new

    @setups.each do |setup|
      subject.instance_eval &setup
    end

    puts "ALERT: #{name}" if subject.instance_eval &event
  end
end
