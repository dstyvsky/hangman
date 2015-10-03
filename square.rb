require 'yaml'

class Square
  def initialize width, height
    @width = width
    @height = height
    @bonus = ['yo', {:msg => 'YAML 4TW'}]
    @me = self
  end
end

puts Square.new(2, 2).to_yaml