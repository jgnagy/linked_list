module LinkedList
  class Sentinel
    attr_reader :list, :disposition
    attr_accessor :pointer

    def initialize(list, disposition)
      @list = list
      @disposition = disposition
    end
  end
end
