# @param {Integer} n
# @return {Boolean}
def reordered_power_of2(n)
    tmp = 1
    sorted_n = n.to_s.split("").sort
    while tmp < 10**10
        p sorted_n
        p tmp.to_s.split("").sort
        return true if tmp.to_s.split("").sort == sorted_n
        tmp = tmp << 1
    end
    false
end

reordered_power_of2(16)