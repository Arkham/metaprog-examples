require 'test/unit'

class Person; end

class TestCheckedAttributes < Test::Unit::TestCase
  def setup
    add_checked_attribute(Person, :age) { |v| v >= 18 }
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_nil_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = nil
    end
  end

  def test_refuses_false_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = false
    end
  end

  def test_refuses_invalid_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = 17
    end
  end
end

def add_checked_attribute(klass, attribute, &block)
  klass.class_eval do
    define_method attribute do
      self.instance_variable_get "@#{attribute}"
    end

    define_method "#{attribute}=" do |value|
      if !value or !block.call(value)
        raise RuntimeError, 'Invalid attribute'
      end

      self.instance_variable_set "@#{attribute}", value
    end
  end
end
