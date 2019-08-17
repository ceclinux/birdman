# @param {Integer} n
# @return {String}
def base_neg2(n)
    len = 0
    lower = 0
    upper = 0
    while !(n >= lower && n <= upper)
        upper += 2 ** len
        lower -= 2 ** (len + 1)
        len += 2
    end

    probe_2("", len, n, lower, upper).to_i.to_s
end

def probe_2(ret, len, n, lower, upper)
    return nil if n < lower || n > upper
    if len <= 0
        return nil if n != 0
        return ret if n == 0
    end
    new_lower = (lower + (2 ** (len - 1))) 
    new_higher = (upper - (2 ** (len - 2)))
    probe_2(ret + "11" , len - 2, n +  (2 ** (len - 1)) - (2 ** (len - 2)), new_lower, new_higher) ||
    probe_2(ret + "10", len - 2, n +  (2 ** (len - 1)) , new_lower, new_higher) ||
    probe_2(ret + "01", len - 2, n -  (2 ** (len - 2)) , new_lower, new_higher) ||
    probe_2(ret + "00", len - 2, n, new_lower, new_higher)
end

p base_neg2(0)