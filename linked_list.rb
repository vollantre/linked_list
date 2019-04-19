class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)
    @head ? @tail.next_node = node : @head = node
    @tail = node
    @size += 1
  end

  def prepend(value)
    node = Node.new(value, @head)
    @tail = node unless @head
    @head = node
    @size += 1
  end

  def size
    @size
  end

  def head
    @head.nil? ? nil : @head.value
  end

  def tail
    @tail.nil? ? nil : @tail.value
  end

  def at(index)
    return nil if index < 0 || index > @size
    tmp = @head
    index.times { tmp = tmp.next_node }
    tmp
  end

  def pop
    tmp = @tail.value
    @tail = at(@size-2)
    @tail.next_node = nil unless @tail.nil?
    @size -= 1
    tmp
  end

  def contains?(data)
    tmp = @head
    (size).times do 
      return true if tmp.value == data
      tmp = tmp.next_node
    end
    false
  end

  def find(data)
    i = 0
    tmp = @head
    while i < @size
      return i if data == tmp.value
      tmp = tmp.next_node
      i+= 1
    end
    nil
  end

  def to_s
    str = ""
    tmp = @head
    @size.times do  
      str << "( #{tmp.value} ) -> " 
      tmp = tmp.next_node
    end
    str + "nil"
  end

  def insert_at(data, index)
    return nil if index < 0 || index >= @size
    new_node = Node.new(data, at(index).next_node)
    at(index-1).next_node = new_node
    @size += 1
  end

  def remove_at(index)
    return nil if index < 0 || index >= @size
    index.zero? ? @head = @head.next_node : at(index-1).next_node = at(index+1)
    @size -= 1
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end