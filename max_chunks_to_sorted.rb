# @param {Integer[]} arr
# @return {Integer}

require 'set'
def max_chunks_to_sorted(arr)
    max_sub_chunks_to_sorted(0, arr)
end
def max_sub_chunks_to_sorted(ini, arr)
    if ini == arr.length
        return 0
    end
    s = Set.new
    less = Set.new
    ini.upto(arr.length - 1).each do |i|
        t = arr[i]
        if less.include? t
            less.delete(t)
        else
            s << t
        end
        if s.include? i
            s.delete(i)
        else
            less << i
        end
        if s.empty?
            return (1 +  max_sub_chunks_to_sorted(i + 1, arr))
        end
    end       
end

p max_chunks_to_sorted([1,0,2,3,4])