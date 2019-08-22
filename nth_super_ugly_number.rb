# @param {Integer} n
# @param {Integer[]} primes
# @return {Integer}
def nth_super_ugly_number(n, primes)
    count = Array.new(primes.count, 0)
    res = Array.new(n)
    res[0] = 1
    
    1.upto(n - 1) do |t|
        min = 1000000000000
        count.each_with_index do |c, i|
            min = [primes[i] * res[c], min].min
        end
        res[t] = min
        count.each_with_index do |c, i|
            if min == primes[i] * res[c]
                count[i] += 1
            end
        end 
    end
    res
end

p nth_super_ugly_number(12, [2, 7, 13, 19])