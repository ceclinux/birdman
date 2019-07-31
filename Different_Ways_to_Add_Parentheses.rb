def calculate(s)
    eval_expr(s.gsub(" ", ""))
end

@i = 0
def eval_expr(expr)
    op = '+'
    total = 0
    curr_num = 0
    while @i < expr.length do
        t = expr[@i]
        if t == '(' 
            @i += 1
            curr_num = eval_expr(expr)
            # p total
        elsif t >= '0' && t <= '9' 
            curr_num = curr_num * 10 + t.to_i
            @i += 1
        elsif t == '+' || t == '-' || t == '*'
           if op == '+'
            total += curr_num
           elsif op == '-'
            total -= curr_num
           else
            total *= curr_num
           end
           op = t
           curr_num = 0
           @i += 1
        else
            if op == '+'
                total += curr_num
            elsif op == '-'
                total -= curr_num
            else
                total *= curr_num
            end
            @i += 1
            # p total
            return total  
        end
    end
    if op == '+'
        total += curr_num
       elsif op == '-'
        total -= curr_num
       else
        total *= curr_num
    end
    total
end

p calculate(" 2-1 + 2 ")