def find_maximum_xor(nums)
    root = build_tree(nums)
    p root

    nums.map do |num|
        temp_depth = @depth - 1
        node = root
        ret = 0
        while temp_depth >= 0
            bit = (1 << temp_depth) & num
            if bit != 0
                if node.right
                    ret += (1 << temp_depth)
                    node = node.right
                else
                    node = node.left
                end
            else
                if node.left
                    ret += (1 << temp_depth)
                    node = node.left
                else
                    node = node.right
                end
            end
            temp_depth -= 1
        end
        p ret
        ret
    end.max
end

def build_tree(nums)
    max_num = nums.max
    @depth = 0
    while max_num > 0
        max_num /= 2
        @depth += 1
    end
    p @depth
    root = Tree.new(0)
    node = root
    nums.each do |num|
        temp_depth = @depth - 1
        node = root
        while temp_depth >= 0
            bit = (1 << temp_depth) & num
            if bit != 0
                if node.left.nil?
                    node.left = Tree.new(1)
                end
                node = node.left
            else
                if node.right.nil?
                    node.right = Tree.new(0)
                end
                node = node.right
            end
            temp_depth -= 1
        end
    end
    root
end

class Tree
    attr_accessor :left, :right, :val
    def initialize(val)
        @val = val
    end
end

p find_maximum_xor([3, 10, 5, 25, 2, 8])