class Basket
  attr_accessor :eggs

  def initialize
    @eggs = []
  end

  define_method :has_eggs? do
    @eggs.count > 0
  end
end

basket = Basket.new
basket.eggs << Object.new
puts basket.has_eggs?
