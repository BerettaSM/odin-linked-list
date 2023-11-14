class Node
    attr_accessor :value, :next_node

    def initialize(value=nil, next_node=nil)
        @value = value
        @next_node = next_node
    end

    def inspect
        "Node ( #{@value} )"
    end
end


class LinkedList
    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def size
        @size
    end

    def head
        @head
    end

    def tail
        @tail
    end

    def append(value)
        new_node = Node.new(value)
        if @size == 0
            @head = @tail = new_node
        else
            @tail.next_node = new_node
            @tail = new_node
        end
        @size += 1
    end

    def prepend(value)
        new_node = Node.new(value)
        if @size == 0
            @head = @tail = new_node
        else
            new_node.next_node = @head
            @head = new_node
        end
        @size += 1
    end

    def at(index)
        return nil if index < 0 || index > @size
        node = @head
        (index).times { node = node.next_node }
        node
    end

    def inspect
        "LinkedList ( head = #{@head.inspect}, tail = #{@tail.inspect}, size = #{@size.inspect} )"
    end

    def to_s
        return "LinkedList ()" if @size == 0
        node = @head
        string = "LinkedList"
        while !node.nil?
            string += " => (#{node.value})"
            node = node.next_node
        end
        string
    end
end
