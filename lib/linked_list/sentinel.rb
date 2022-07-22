# frozen_string_literal: true

module LinkedList
  # Sentinels are used to form the ends of Lists
  class Sentinel
    attr_reader :list, :disposition
    attr_accessor :pointer

    def initialize(list, disposition)
      @list = list
      @disposition = disposition
    end
  end
end
