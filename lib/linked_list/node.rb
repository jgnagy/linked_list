# frozen_string_literal: true

module LinkedList
  # Nodes are used to form the List
  class Node
    include Comparable

    attr_reader :list
    attr_accessor :datum, :pointer, :back_pointer

    def initialize(list, data, back_pointer, pointer)
      @list         = list
      @datum        = data
      @pointer      = pointer
      @back_pointer = back_pointer
    end

    def <=>(other)
      datum <=> other.datum
    end
  end
end
