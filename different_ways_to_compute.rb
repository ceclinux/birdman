# @param {String} input
# @return {Integer[]}
def diff_ways_to_compute(input)
    ret = []
    input.chars.each_with_index  do |c, i|
        if ['-', '*', '+'].include? c
            left_ways = diff_ways_to_compute(input[0...i])
            right_ways = diff_ways_to_compute(input[(i + 1)..-1])
            product = left_ways.product(right_ways)
            if c == '-'
                product.each do |pro|
                    ret << (pro[0] - pro[1])
                end
            end
            if c == '*'
                product.each do |pro|
                    ret << (pro[0] * pro[1])
                end
            end
            if c == '+'
                product.each do |pro|
                    ret << (pro[0] + pro[1])
                end
            end
        
        end
        
    end
    if ret.size == 0
        ret << input.to_i
    end
    ret
end



p diff_ways_to_compute("2*3-4*5")