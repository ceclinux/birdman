# @param {Integer} n
# @return {Integer}
def clumsy(n)
    ops = ["*", "/" , "+", "-"].cycle
    add_and_minus = []
    num = 1
    n.downto(1) do |t|
        if t == n
            op = "*"
        else
            op = ops.next
        end
        if op == "*"
            num *=  t
        elsif op == "/"
            num /= t
        elsif
            add_and_minus << num << op 
            num = t
        end
    end
    add_and_minus << num
    p add_and_minus
    total = 0
    op = "+"
    add_and_minus.each do |t|
        if t == "+"
            op = "+"
        elsif t == "-"
            op = "-"
        else
            if op == "+"
                total += t
            else
                total -= t
            end
        end
    end
    total
end

# p clumsy(10)
# 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1