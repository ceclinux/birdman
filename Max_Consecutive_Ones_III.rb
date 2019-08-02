# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def longest_ones(a, k)
    prev = nil
    ret = []
    count = 0
    a.each do |t|
        if t == 1
            if prev == 0
                ret << count
                count = 0
            end
            prev = 1 
        else
            if prev == 1
                ret << count
                count = 0
            end        
            prev = 0
        end
        count += 1
    end
    ret << count
   
    first_zeros = 0
   
    reversed = ret.reverse
    if a.last == 0
        reversed.shift
    end    
    if a.first == 0
        first_zeros = ret.shift
    end
    [[first_zeros, k].min, get_max_len_by_arr(ret, k),  get_max_len_by_arr(reversed, k)].max
    
end

def get_max_len_by_arr(ret, k)
    max_len = 0
    (0..ret.length).step(2) do |t|
        o = t
        k_remain = k
        s = 0
        while o < ret.length 
            a = ret[o]
            b = ret[o + 1]
            s += a
            if b.nil?
                max_len = [s, max_len].max
            elsif k_remain < b
                max_len = [s + k_remain, max_len].max
                break
            else
                k_remain -= b
                s += b
            end
            o = o + 2
        end
        if o == ret.length
            max_len = [s , max_len].max
        end
    end
    p ret
    p max_len
    max_len
end

p longest_ones([0,0,0,1], 4)