require 'contracts'

# The class is for storing element's data
#
class Element
  include Contracts::Core
  include Contracts::Builtin
  include Contracts::Invariants

  attr_accessor :priority, :value

  invariant(:priority) { priority.is_a?(Integer) && priority >= 0 }
  invariant(:value)    { value.is_a?(Integer) && value >= 0 }

  Contract ({ priority: Pos, value: Pos }) => Any
  def initialize(priority: 0, value: 0)
    @priority = priority
    @value = value
  end

  Contract Element => Num
  def <=>(other)
    priority <=> other.priority
  end

  Contract None => String
  def to_s
    "priority: #{priority}, value: #{value}"
  end
end
