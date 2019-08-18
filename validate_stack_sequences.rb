# @param {Integer[]} pushed
# @param {Integer[]} popped
# @return {Boolean}
def validate_stack_sequences(pushed, popped)
    helper(0, 0, pushed, popped, [])
end

def helper(pushed_pointer, popped_pointer, pushed, popped, stack)
    p stack
    p pushed_pointer
    p popped_pointer
    return true if pushed_pointer == pushed.length && popped_pointer == popped.length
    if pushed_pointer == pushed.length && stack.last != popped[popped_pointer]
        return false
    end
    if stack.last == popped[popped_pointer]
        stack.pop
        helper(pushed_pointer, popped_pointer + 1, pushed, popped, stack)
    else 
        stack.push pushed[pushed_pointer]
        helper(pushed_pointer + 1, popped_pointer, pushed, popped, stack)

    end
end
p validate_stack_sequences([1,2,3,4,5], [4,5,3,2,1])
p validate_stack_sequences([1,2,3,4,5], [4,3,5,1,2])