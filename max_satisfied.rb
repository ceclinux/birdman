# @param {Integer[]} customers
# @param {Integer[]} grumpy
# @param {Integer} x
# @return {Integer}
def max_satisfied(customers, grumpy, x)
    if x > customers.length
        return customers.sum
    end

    head = 0
    max = (head.upto(head + x - 1).map do |t|
        customers[t]
    end).sum + ((head + x).upto(customers.length - 1).map do |t|
        if grumpy[t] == 1
            0
        else
            customers[t]
        end
    end).sum
    curr = max
    head = 1
    while head + x - 1 < customers.length
        if grumpy[head - 1] == 1
            curr -= customers[head - 1] 
        end
        curr += customers[head + x - 1] if grumpy[head + x - 1] == 1
        max = [curr, max].max
        head += 1
    end
    max
end

p max_satisfied([5,8],[0,1],1)