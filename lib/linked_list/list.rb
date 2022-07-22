# frozen_string_literal: true

module LinkedList
  # The List is the core of the LinkedList module
  class List
    include Enumerable

    def initialize
      @beginning = Sentinel.new(self, :beginning)
      @ending    = Sentinel.new(self, :ending)
      @beginning.pointer = @ending
      @ending.pointer = @beginning
    end

    def each
      return enum_for(:each) unless block_given?

      return if empty?

      node = @beginning
      until node.pointer.is_a?(Sentinel)
        node = seek(node)
        yield node
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

    alias << push

    def random
      return nil if empty?

      self[rand(size)]
    end

    def reverse
      other = self.class.new
      reverse_each do |node|
        other.push node.datum
      end
      other
    end

    def rewind(node = nil)
      if node
        node.respond_to?(:back_pointer) ? node.back_pointer : @beginning
      else
        @beginning
      end
    end

    def seek(node)
      node.pointer
    end

    # Remove and return the first entry from a linked list (as original datum)
    def shift
      if empty?
        nil
      else
        previous = first
        more_previous = previous.pointer
        more_previous.back_pointer = @beginning
        @beginning.pointer = more_previous
        previous.datum
      end
    end

    def size
      if empty?
        0
      else
        count = 0
        each { |_n| count += 1 }
        count
      end
    end

    # Add data to the beginning of the linked list
    # @return Node
    def unshift(data)
      if empty?
        push data # don't reinvent this part
      else
        previous = first
        previous.back_pointer = Node.new(self, data, @beginning, previous)
        @beginning.pointer = previous.back_pointer
      end
    end

    def [](index)
      if index.negative?
        node = @ending.pointer
        ((index * -1) - 1).times do
          node = rewind(node)
        end
      else
        node = @beginning.pointer
        index.times do
          node = seek(node)
        end
      end
      node
    end
  end
end
