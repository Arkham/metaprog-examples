lambda {
  events = {}
  setups = []

  Kernel.send :define_method, :reset_events do
    events = {}
    setups = []
  end

  Kernel.send :define_method, :event do |name, &block|
    events[name] = block
  end

  Kernel.send :define_method, :setup do |&block|
    setups << block
  end

  Kernel.send :define_method, :each_event do |&block|
    events.each do |name, event|
      block.call name, event
    end
  end

  Kernel.send :define_method, :each_setup do |&block|
    setups.each do |setup|
      block.call setup
    end
  end
}.call

Dir.glob('*events.rb').each do |file|
  reset_events

  load file

  each_event do |name, event|
    subject = Object.new

    each_setup do |setup|
      subject.instance_eval &setup
    end

    puts "ALERT: #{name}" if subject.instance_eval &event
  end
end
