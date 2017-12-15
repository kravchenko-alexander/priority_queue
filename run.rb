require_relative 'priority_queue'
require_relative 'element'

q = PriorityQueue.new
q << Element.new(priority: 5, value: 1)
q << Element.new(priority: 2, value: 2)
q << Element.new(priority: 4, value: 3)

puts q.pop