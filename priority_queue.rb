require_relative 'element'
require 'contracts'

# The class is for storing queue
#
class PriorityQueue
  include Contracts::Core
  include Contracts::Builtin
  include Contracts::Invariants

  attr_reader :elements

  invariant(:elements) { elements.is_a?(Array) && elements.all? { |el| el.is_a?(Element) } }

  def initialize
    @elements = []
  end

  Contract Element => ArrayOf[Or[Element, nil]]
  def <<(element)
    elements << element
  end

  Contract None => Or[Element, nil]
  def pop
    elements.sort!
    elements.delete_at(elements.size - 1)
  end
end
