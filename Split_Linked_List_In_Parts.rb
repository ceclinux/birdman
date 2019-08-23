# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} root
# @param {Integer} k
# @return {ListNode[]}
def split_list_to_parts(root, k)
    head = root
    count = 0
    while !head.nil?
        head = head.next
        count += 1
    end

    helper(root, k, count)
end

def helper(root, k, count)
    if k == 0
        return []
    end
    curr_count = (count.to_f / k).ceil
    curr_list = []
    while curr_count > 0
        curr_list << root.val
        root = root.next
        curr_count -= 1
    end
    helper(root, k - 1, count - (count.to_f / k).ceil).unshift curr_list
end
