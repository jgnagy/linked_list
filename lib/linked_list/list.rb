module LinkedList
  class List
    include Enumerable

    def initialize
      @beginning = Sentinel.new(self, :beginning)
      @ending    = Sentinel.new(self, :ending)
      @beginning.pointer = @ending
      @ending.pointer = @beginning
    end

    # Add data to the end of the linked list
    # @return Node
    def push(data)
      if empty?
        @beginning.pointer = Node.new(self, data, @beginning, @ending)
        @ending.pointer = @beginning.pointer
      else
        previous = last
        previous.pointer = Node.new(self, data, previous, @ending)
        @ending.pointer = previous.pointer
      end
    end

    alias_method :<<, :push

    # Remove and return the last entry from a linked list (as original datum)
    def pop
      if empty?
        nil
      else
        previous = last
        more_previous = previous.back_pointer
        more_previous.pointer = @ending
        @ending.pointer = more_previous
        previous.datum
      end
    end

    def each
      return enum_for(:each) unless block_given?
      unless empty?
        node = @beginning
        until node.pointer.is_a?(Sentinel)
          node = seek(node)
          yield node
        end
      end
    end

    def empty?
      @beginning.pointer.is_a?(Sentinel)
    end

    def first
      empty? ? nil : @beginning.pointer
    end

    def last
      empty? ? nil : @ending.pointer
    end

    def seek(node)
      node.pointer
    end

    def reverse(node)
      node.respond_to?(:back_pointer) ? node.back_pointer : nil
    end

    def rewind
      @beginning
    end

    def size
      if empty?
        0
      else
        count = 0
        each {|_n| count += 1}
        count
      end
    end

    def [](index)
      node = @beginning.pointer
      index.times do
        node = seek(node)
      end
      node
    end

    def random
      return nil if empty?
      self[rand(size)]
    end
  end
end
