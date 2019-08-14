# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
    arr = []
    node = root
    last_visted = nil
    ret = []
    while !(arr.empty? && node.nil?)
        if !node.nil?
            arr << node
            node = node.left
        else
            peeknode = arr.last
           
                if peeknode.right != nil && last_visted != peeknode.right
                    node = peeknode.right
                else
                    ret << peeknode.val
                    last_visted = arr.pop
                end
            end
            
    end
    ret
end